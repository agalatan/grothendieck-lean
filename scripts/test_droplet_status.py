#!/usr/bin/env python3
"""Hermetic unit tests for scripts/droplet_status.sh (AGENTS.md §12, #783).

Agent-ID: gemini-21d5
"""
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("droplet_status.sh")


class DropletStatusTest(unittest.TestCase):
    def _make_fixture(self, tmp: Path, *, down_hosts=(), nproc=32, load1="2.00",
                      mem_line="Mem: 251 10 200 0 41 240", runner_online=False,
                      runner_worker=False, live_pgids=()):
        bin_dir = tmp / "bin"
        bin_dir.mkdir()
        home_dir = tmp / "home"
        home_dir.mkdir()
        proc_dir = tmp / "proc"
        proc_dir.mkdir()
        cg_dir = tmp / "cgroup"
        cg_dir.mkdir()

        (proc_dir / "loadavg").write_text(f"{load1} 1.00 0.50 1/200 12345\n")

        def write_tool(name: str, body: str):
            p = bin_dir / name
            p.write_text("#!/usr/bin/env bash\n" + body + "\n")
            p.chmod(0o755)

        down_str = " ".join(down_hosts)
        write_tool(
            "ssh",
            f'''
host=""
while [ "$#" -gt 0 ]; do
  case "$1" in
    -o) shift 2 ;;
    -*) shift ;;
    *) host="$1"; shift; break ;;
  esac
done
for dh in {down_str}; do
  if [ "$host" = "$dh" ]; then exit 255; fi
done
if [ "${{1:-}}" = "true" ]; then exit 0; fi
export HOME="{home_dir}"
export PROC_ROOT="{proc_dir}"
export CGROUP_ROOT="{cg_dir}"
exec "$@"
''',
        )
        write_tool("nproc", f'echo "{nproc}"')
        write_tool("uptime", 'echo " 03:00:00 up 1 day,  1 user,  load average: ' + load1 + ', 1.00, 0.50"')
        write_tool("free", f'echo "              total used free shared buff/cache available"; echo "{mem_line}"')
        write_tool("df", 'if [ "${1:-}" = "-h" ]; then echo "Filesystem Size Used Avail Use% Mounted"; echo "/dev/sda1 100G 20G 80G 20% /"; else echo "Filesystem 1K-blocks Used Available Use% Mounted"; echo "/dev/sda1 104857600 20971520 83886080 20% /"; fi')
        write_tool("du", "exit 0")

        live_pg_str = " ".join(str(x) for x in live_pgids)
        write_tool(
            "pgrep",
            f'''
if [ "${{1:-}}" = "-x" ]; then
  case "${{2:-}}" in
    Runner.Listener) {"echo 3049" if runner_online else "exit 1"} ;;
    Runner.Worker) {"echo 3099" if runner_worker else "exit 1"} ;;
    lean) exit 1 ;;
    *) exit 1 ;;
  esac
elif [ "${{1:-}}" = "-g" ]; then
  for g in {live_pg_str}; do
    if [ "$g" = "${{2:-}}" ]; then echo "$g"; exit 0; fi
  done
  exit 1
fi
exit 1
''',
        )
        write_tool(
            "ps",
            '''
if [ "${1:-}" = "-eo" ]; then
  exit 0
fi
echo "3049 /home/user/actions-runner-3/bin/Runner.Listener"
''',
        )
        env = {**os.environ, "PATH": str(bin_dir) + os.pathsep + os.environ["PATH"]}
        return env, home_dir, proc_dir, cg_dir

    def _add_proc(self, proc_dir: Path, cg_dir: Path, pid: int, pgid: int, cwd: Path,
                  *, name="python3", vmrss_kb=2097152, anon_kb=524288, cpus="16-23",
                  cg_rel="/user.slice/run-test.scope", mem_max_bytes=None, mem_cur_bytes=None):
        pdir = proc_dir / str(pid)
        pdir.mkdir()
        (pdir / "cwd").symlink_to(cwd)
        (pdir / "status").write_text(
            f"Name:\t{name}\nVmRSS:\t{vmrss_kb} kB\nRssAnon:\t{anon_kb} kB\nCpus_allowed_list:\t{cpus}\n"
        )
        (pdir / "stat").write_text(f"{pid} ({name}) R {pid} {pgid} {pgid} 0 -1 0 0 0 0 0 0 0 0 0 20 0 1 0 100\n")
        (pdir / "cgroup").write_text(f"0::{cg_rel}\n")
        target_cg = cg_dir / cg_rel.lstrip("/")
        target_cg.mkdir(parents=True, exist_ok=True)
        (target_cg / "memory.max").write_text("max\n" if mem_max_bytes is None else f"{mem_max_bytes}\n")
        if mem_cur_bytes is not None:
            (target_cg / "memory.current").write_text(f"{mem_cur_bytes}\n")

    def test_unreachable_temporary_droplets_do_not_fail(self):
        with tempfile.TemporaryDirectory() as tmpd:
            env, _, _, _ = self._make_fixture(Path(tmpd), down_hosts=("big", "mega"), nproc=8, load1="0.10",
                                              mem_line="Mem: 31 2 28 0 1 29")
            res = subprocess.run([str(SCRIPT)], env=env, capture_output=True, text=True)
            self.assertEqual(res.returncode, 0, res.stderr)
            self.assertIn("== yo (", res.stdout)
            self.assertIn("== big: down / not provisioned", res.stdout)
            self.assertIn("== mega: down / not provisioned", res.stdout)

    def test_runner_online_slots_and_cgroup_memory_max(self):
        with tempfile.TemporaryDirectory() as tmpd:
            env, home, proc_dir, cg_dir = self._make_fixture(
                Path(tmpd), nproc=32, load1="16.00", mem_line="Mem: 251 40 180 0 31 210",
                runner_online=True, runner_worker=True, live_pgids=(7777,),
            )
            slots = home / "research-slots"
            (slots / "16-23").mkdir(parents=True)
            (slots / "16-23" / "owner").write_text("gemini-21d5 7777 /home/user/gemini-21d5-job\n")
            (slots / "24-31").mkdir(parents=True)
            (slots / "24-31" / "owner").write_text("codex-dead 9999 /home/user/codex-dead-job\n")

            job_dir = home / "gemini-21d5-job"
            job_dir.mkdir()
            self._add_proc(
                proc_dir, cg_dir, pid=7778, pgid=7777, cwd=job_dir,
                vmrss_kb=10 * 1024 * 1024, anon_kb=3 * 1024 * 1024, cpus="16-23",
                mem_max_bytes=48 * (1024 ** 3), mem_cur_bytes=4 * (1024 ** 3),
            )

            res = subprocess.run([str(SCRIPT), "mega"], env=env, capture_output=True, text=True)
            self.assertEqual(res.returncode, 0, res.stderr)
            self.assertIn("ONLINE (ACTIVE JOB:", res.stdout)
            self.assertIn("runner ONLINE (Lean FORBIDDEN): research half = cores 16-31 (8-core slots, MemoryMax=48G, aggregate <= 125 GB)", res.stdout)
            self.assertIn("[16-23: RESERVED (gemini-21d5 7777 /home/user/gemini-21d5-job)]", res.stdout)
            self.assertIn("[24-31: STALE (codex-dead 9999 /home/user/codex-dead-job — pgid 9999 gone)]", res.stdout)
            self.assertIn("MemoryMax=48.0G", res.stdout)
            self.assertIn("cg=4.00G", res.stdout)

    def test_runner_offline_half_share_and_quarter_floor_and_shared_olean_rss(self):
        with tempfile.TemporaryDirectory() as tmpd:
            env, home, proc_dir, cg_dir = self._make_fixture(
                Path(tmpd), nproc=48, load1="24.00", mem_line="Mem: 94 32 10 0 52 60",
                runner_online=False,
            )
            job_dir = home / "claude-b9ee-lean"
            job_dir.mkdir()
            # Simulate 20 lean workers each with 2 GiB shared .olean VmRSS but only 0.5 GiB private RssAnon:
            # total RssAnon = 10.00 GiB (not 40 GiB!).
            for i in range(20):
                self._add_proc(
                    proc_dir, cg_dir, pid=5000 + i, pgid=5000, cwd=job_dir,
                    name="lean", vmrss_kb=2 * 1024 * 1024, anon_kb=512 * 1024, cpus="0-23",
                )
            res = subprocess.run([str(SCRIPT), "big"], env=env, capture_output=True, text=True)
            self.assertEqual(res.returncode, 0, res.stderr)
            self.assertIn("runner OFFLINE: new job may take <= 12 cores and MemoryMax=30G", res.stdout)
            self.assertIn("active user mem 10.00 GB", res.stdout)
            self.assertIn("anon=10.00G", res.stdout)

        # Below 1/4 free floor -> WAIT
        with tempfile.TemporaryDirectory() as tmpd:
            env2, _, _, _ = self._make_fixture(
                Path(tmpd), nproc=48, load1="40.00", mem_line="Mem: 94 70 4 0 20 20",
                runner_online=False,
            )
            res2 = subprocess.run([str(SCRIPT), "big"], env=env2, capture_output=True, text=True)
            self.assertEqual(res2.returncode, 0, res2.stderr)
            self.assertIn("runner OFFLINE — WAIT (below 1/4 free floor)", res2.stdout)


if __name__ == "__main__":
    unittest.main()
