import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleRoots15

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootLookup
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

/-- Total extension; only 1 ≤ n ≤ 501 is used by root certificates. -/
def S (n : ℕ) : IntervalDyadic :=
  if n < 251 then
    if n < 126 then
      if n < 63 then
        if n < 32 then
          if n < 16 then
            if n < 8 then
              if n < 4 then
                if n < 2 then
                  OriginalRow227TriangleRoots00.root1
                else
                  if n < 3 then
                    OriginalRow227TriangleRoots00.root2
                  else
                    OriginalRow227TriangleRoots00.root3
              else
                if n < 6 then
                  if n < 5 then
                    OriginalRow227TriangleRoots00.root4
                  else
                    OriginalRow227TriangleRoots00.root5
                else
                  if n < 7 then
                    OriginalRow227TriangleRoots00.root6
                  else
                    OriginalRow227TriangleRoots00.root7
            else
              if n < 12 then
                if n < 10 then
                  if n < 9 then
                    OriginalRow227TriangleRoots00.root8
                  else
                    OriginalRow227TriangleRoots00.root9
                else
                  if n < 11 then
                    OriginalRow227TriangleRoots00.root10
                  else
                    OriginalRow227TriangleRoots00.root11
              else
                if n < 14 then
                  if n < 13 then
                    OriginalRow227TriangleRoots00.root12
                  else
                    OriginalRow227TriangleRoots00.root13
                else
                  if n < 15 then
                    OriginalRow227TriangleRoots00.root14
                  else
                    OriginalRow227TriangleRoots00.root15
          else
            if n < 24 then
              if n < 20 then
                if n < 18 then
                  if n < 17 then
                    OriginalRow227TriangleRoots00.root16
                  else
                    OriginalRow227TriangleRoots00.root17
                else
                  if n < 19 then
                    OriginalRow227TriangleRoots00.root18
                  else
                    OriginalRow227TriangleRoots00.root19
              else
                if n < 22 then
                  if n < 21 then
                    OriginalRow227TriangleRoots00.root20
                  else
                    OriginalRow227TriangleRoots00.root21
                else
                  if n < 23 then
                    OriginalRow227TriangleRoots00.root22
                  else
                    OriginalRow227TriangleRoots00.root23
            else
              if n < 28 then
                if n < 26 then
                  if n < 25 then
                    OriginalRow227TriangleRoots00.root24
                  else
                    OriginalRow227TriangleRoots00.root25
                else
                  if n < 27 then
                    OriginalRow227TriangleRoots00.root26
                  else
                    OriginalRow227TriangleRoots00.root27
              else
                if n < 30 then
                  if n < 29 then
                    OriginalRow227TriangleRoots00.root28
                  else
                    OriginalRow227TriangleRoots00.root29
                else
                  if n < 31 then
                    OriginalRow227TriangleRoots00.root30
                  else
                    OriginalRow227TriangleRoots00.root31
        else
          if n < 47 then
            if n < 39 then
              if n < 35 then
                if n < 33 then
                  OriginalRow227TriangleRoots00.root32
                else
                  if n < 34 then
                    OriginalRow227TriangleRoots01.root33
                  else
                    OriginalRow227TriangleRoots01.root34
              else
                if n < 37 then
                  if n < 36 then
                    OriginalRow227TriangleRoots01.root35
                  else
                    OriginalRow227TriangleRoots01.root36
                else
                  if n < 38 then
                    OriginalRow227TriangleRoots01.root37
                  else
                    OriginalRow227TriangleRoots01.root38
            else
              if n < 43 then
                if n < 41 then
                  if n < 40 then
                    OriginalRow227TriangleRoots01.root39
                  else
                    OriginalRow227TriangleRoots01.root40
                else
                  if n < 42 then
                    OriginalRow227TriangleRoots01.root41
                  else
                    OriginalRow227TriangleRoots01.root42
              else
                if n < 45 then
                  if n < 44 then
                    OriginalRow227TriangleRoots01.root43
                  else
                    OriginalRow227TriangleRoots01.root44
                else
                  if n < 46 then
                    OriginalRow227TriangleRoots01.root45
                  else
                    OriginalRow227TriangleRoots01.root46
          else
            if n < 55 then
              if n < 51 then
                if n < 49 then
                  if n < 48 then
                    OriginalRow227TriangleRoots01.root47
                  else
                    OriginalRow227TriangleRoots01.root48
                else
                  if n < 50 then
                    OriginalRow227TriangleRoots01.root49
                  else
                    OriginalRow227TriangleRoots01.root50
              else
                if n < 53 then
                  if n < 52 then
                    OriginalRow227TriangleRoots01.root51
                  else
                    OriginalRow227TriangleRoots01.root52
                else
                  if n < 54 then
                    OriginalRow227TriangleRoots01.root53
                  else
                    OriginalRow227TriangleRoots01.root54
            else
              if n < 59 then
                if n < 57 then
                  if n < 56 then
                    OriginalRow227TriangleRoots01.root55
                  else
                    OriginalRow227TriangleRoots01.root56
                else
                  if n < 58 then
                    OriginalRow227TriangleRoots01.root57
                  else
                    OriginalRow227TriangleRoots01.root58
              else
                if n < 61 then
                  if n < 60 then
                    OriginalRow227TriangleRoots01.root59
                  else
                    OriginalRow227TriangleRoots01.root60
                else
                  if n < 62 then
                    OriginalRow227TriangleRoots01.root61
                  else
                    OriginalRow227TriangleRoots01.root62
      else
        if n < 94 then
          if n < 78 then
            if n < 70 then
              if n < 66 then
                if n < 64 then
                  OriginalRow227TriangleRoots01.root63
                else
                  if n < 65 then
                    OriginalRow227TriangleRoots01.root64
                  else
                    OriginalRow227TriangleRoots02.root65
              else
                if n < 68 then
                  if n < 67 then
                    OriginalRow227TriangleRoots02.root66
                  else
                    OriginalRow227TriangleRoots02.root67
                else
                  if n < 69 then
                    OriginalRow227TriangleRoots02.root68
                  else
                    OriginalRow227TriangleRoots02.root69
            else
              if n < 74 then
                if n < 72 then
                  if n < 71 then
                    OriginalRow227TriangleRoots02.root70
                  else
                    OriginalRow227TriangleRoots02.root71
                else
                  if n < 73 then
                    OriginalRow227TriangleRoots02.root72
                  else
                    OriginalRow227TriangleRoots02.root73
              else
                if n < 76 then
                  if n < 75 then
                    OriginalRow227TriangleRoots02.root74
                  else
                    OriginalRow227TriangleRoots02.root75
                else
                  if n < 77 then
                    OriginalRow227TriangleRoots02.root76
                  else
                    OriginalRow227TriangleRoots02.root77
          else
            if n < 86 then
              if n < 82 then
                if n < 80 then
                  if n < 79 then
                    OriginalRow227TriangleRoots02.root78
                  else
                    OriginalRow227TriangleRoots02.root79
                else
                  if n < 81 then
                    OriginalRow227TriangleRoots02.root80
                  else
                    OriginalRow227TriangleRoots02.root81
              else
                if n < 84 then
                  if n < 83 then
                    OriginalRow227TriangleRoots02.root82
                  else
                    OriginalRow227TriangleRoots02.root83
                else
                  if n < 85 then
                    OriginalRow227TriangleRoots02.root84
                  else
                    OriginalRow227TriangleRoots02.root85
            else
              if n < 90 then
                if n < 88 then
                  if n < 87 then
                    OriginalRow227TriangleRoots02.root86
                  else
                    OriginalRow227TriangleRoots02.root87
                else
                  if n < 89 then
                    OriginalRow227TriangleRoots02.root88
                  else
                    OriginalRow227TriangleRoots02.root89
              else
                if n < 92 then
                  if n < 91 then
                    OriginalRow227TriangleRoots02.root90
                  else
                    OriginalRow227TriangleRoots02.root91
                else
                  if n < 93 then
                    OriginalRow227TriangleRoots02.root92
                  else
                    OriginalRow227TriangleRoots02.root93
        else
          if n < 110 then
            if n < 102 then
              if n < 98 then
                if n < 96 then
                  if n < 95 then
                    OriginalRow227TriangleRoots02.root94
                  else
                    OriginalRow227TriangleRoots02.root95
                else
                  if n < 97 then
                    OriginalRow227TriangleRoots02.root96
                  else
                    OriginalRow227TriangleRoots03.root97
              else
                if n < 100 then
                  if n < 99 then
                    OriginalRow227TriangleRoots03.root98
                  else
                    OriginalRow227TriangleRoots03.root99
                else
                  if n < 101 then
                    OriginalRow227TriangleRoots03.root100
                  else
                    OriginalRow227TriangleRoots03.root101
            else
              if n < 106 then
                if n < 104 then
                  if n < 103 then
                    OriginalRow227TriangleRoots03.root102
                  else
                    OriginalRow227TriangleRoots03.root103
                else
                  if n < 105 then
                    OriginalRow227TriangleRoots03.root104
                  else
                    OriginalRow227TriangleRoots03.root105
              else
                if n < 108 then
                  if n < 107 then
                    OriginalRow227TriangleRoots03.root106
                  else
                    OriginalRow227TriangleRoots03.root107
                else
                  if n < 109 then
                    OriginalRow227TriangleRoots03.root108
                  else
                    OriginalRow227TriangleRoots03.root109
          else
            if n < 118 then
              if n < 114 then
                if n < 112 then
                  if n < 111 then
                    OriginalRow227TriangleRoots03.root110
                  else
                    OriginalRow227TriangleRoots03.root111
                else
                  if n < 113 then
                    OriginalRow227TriangleRoots03.root112
                  else
                    OriginalRow227TriangleRoots03.root113
              else
                if n < 116 then
                  if n < 115 then
                    OriginalRow227TriangleRoots03.root114
                  else
                    OriginalRow227TriangleRoots03.root115
                else
                  if n < 117 then
                    OriginalRow227TriangleRoots03.root116
                  else
                    OriginalRow227TriangleRoots03.root117
            else
              if n < 122 then
                if n < 120 then
                  if n < 119 then
                    OriginalRow227TriangleRoots03.root118
                  else
                    OriginalRow227TriangleRoots03.root119
                else
                  if n < 121 then
                    OriginalRow227TriangleRoots03.root120
                  else
                    OriginalRow227TriangleRoots03.root121
              else
                if n < 124 then
                  if n < 123 then
                    OriginalRow227TriangleRoots03.root122
                  else
                    OriginalRow227TriangleRoots03.root123
                else
                  if n < 125 then
                    OriginalRow227TriangleRoots03.root124
                  else
                    OriginalRow227TriangleRoots03.root125
    else
      if n < 188 then
        if n < 157 then
          if n < 141 then
            if n < 133 then
              if n < 129 then
                if n < 127 then
                  OriginalRow227TriangleRoots03.root126
                else
                  if n < 128 then
                    OriginalRow227TriangleRoots03.root127
                  else
                    OriginalRow227TriangleRoots03.root128
              else
                if n < 131 then
                  if n < 130 then
                    OriginalRow227TriangleRoots04.root129
                  else
                    OriginalRow227TriangleRoots04.root130
                else
                  if n < 132 then
                    OriginalRow227TriangleRoots04.root131
                  else
                    OriginalRow227TriangleRoots04.root132
            else
              if n < 137 then
                if n < 135 then
                  if n < 134 then
                    OriginalRow227TriangleRoots04.root133
                  else
                    OriginalRow227TriangleRoots04.root134
                else
                  if n < 136 then
                    OriginalRow227TriangleRoots04.root135
                  else
                    OriginalRow227TriangleRoots04.root136
              else
                if n < 139 then
                  if n < 138 then
                    OriginalRow227TriangleRoots04.root137
                  else
                    OriginalRow227TriangleRoots04.root138
                else
                  if n < 140 then
                    OriginalRow227TriangleRoots04.root139
                  else
                    OriginalRow227TriangleRoots04.root140
          else
            if n < 149 then
              if n < 145 then
                if n < 143 then
                  if n < 142 then
                    OriginalRow227TriangleRoots04.root141
                  else
                    OriginalRow227TriangleRoots04.root142
                else
                  if n < 144 then
                    OriginalRow227TriangleRoots04.root143
                  else
                    OriginalRow227TriangleRoots04.root144
              else
                if n < 147 then
                  if n < 146 then
                    OriginalRow227TriangleRoots04.root145
                  else
                    OriginalRow227TriangleRoots04.root146
                else
                  if n < 148 then
                    OriginalRow227TriangleRoots04.root147
                  else
                    OriginalRow227TriangleRoots04.root148
            else
              if n < 153 then
                if n < 151 then
                  if n < 150 then
                    OriginalRow227TriangleRoots04.root149
                  else
                    OriginalRow227TriangleRoots04.root150
                else
                  if n < 152 then
                    OriginalRow227TriangleRoots04.root151
                  else
                    OriginalRow227TriangleRoots04.root152
              else
                if n < 155 then
                  if n < 154 then
                    OriginalRow227TriangleRoots04.root153
                  else
                    OriginalRow227TriangleRoots04.root154
                else
                  if n < 156 then
                    OriginalRow227TriangleRoots04.root155
                  else
                    OriginalRow227TriangleRoots04.root156
        else
          if n < 172 then
            if n < 164 then
              if n < 160 then
                if n < 158 then
                  OriginalRow227TriangleRoots04.root157
                else
                  if n < 159 then
                    OriginalRow227TriangleRoots04.root158
                  else
                    OriginalRow227TriangleRoots04.root159
              else
                if n < 162 then
                  if n < 161 then
                    OriginalRow227TriangleRoots04.root160
                  else
                    OriginalRow227TriangleRoots05.root161
                else
                  if n < 163 then
                    OriginalRow227TriangleRoots05.root162
                  else
                    OriginalRow227TriangleRoots05.root163
            else
              if n < 168 then
                if n < 166 then
                  if n < 165 then
                    OriginalRow227TriangleRoots05.root164
                  else
                    OriginalRow227TriangleRoots05.root165
                else
                  if n < 167 then
                    OriginalRow227TriangleRoots05.root166
                  else
                    OriginalRow227TriangleRoots05.root167
              else
                if n < 170 then
                  if n < 169 then
                    OriginalRow227TriangleRoots05.root168
                  else
                    OriginalRow227TriangleRoots05.root169
                else
                  if n < 171 then
                    OriginalRow227TriangleRoots05.root170
                  else
                    OriginalRow227TriangleRoots05.root171
          else
            if n < 180 then
              if n < 176 then
                if n < 174 then
                  if n < 173 then
                    OriginalRow227TriangleRoots05.root172
                  else
                    OriginalRow227TriangleRoots05.root173
                else
                  if n < 175 then
                    OriginalRow227TriangleRoots05.root174
                  else
                    OriginalRow227TriangleRoots05.root175
              else
                if n < 178 then
                  if n < 177 then
                    OriginalRow227TriangleRoots05.root176
                  else
                    OriginalRow227TriangleRoots05.root177
                else
                  if n < 179 then
                    OriginalRow227TriangleRoots05.root178
                  else
                    OriginalRow227TriangleRoots05.root179
            else
              if n < 184 then
                if n < 182 then
                  if n < 181 then
                    OriginalRow227TriangleRoots05.root180
                  else
                    OriginalRow227TriangleRoots05.root181
                else
                  if n < 183 then
                    OriginalRow227TriangleRoots05.root182
                  else
                    OriginalRow227TriangleRoots05.root183
              else
                if n < 186 then
                  if n < 185 then
                    OriginalRow227TriangleRoots05.root184
                  else
                    OriginalRow227TriangleRoots05.root185
                else
                  if n < 187 then
                    OriginalRow227TriangleRoots05.root186
                  else
                    OriginalRow227TriangleRoots05.root187
      else
        if n < 219 then
          if n < 203 then
            if n < 195 then
              if n < 191 then
                if n < 189 then
                  OriginalRow227TriangleRoots05.root188
                else
                  if n < 190 then
                    OriginalRow227TriangleRoots05.root189
                  else
                    OriginalRow227TriangleRoots05.root190
              else
                if n < 193 then
                  if n < 192 then
                    OriginalRow227TriangleRoots05.root191
                  else
                    OriginalRow227TriangleRoots05.root192
                else
                  if n < 194 then
                    OriginalRow227TriangleRoots06.root193
                  else
                    OriginalRow227TriangleRoots06.root194
            else
              if n < 199 then
                if n < 197 then
                  if n < 196 then
                    OriginalRow227TriangleRoots06.root195
                  else
                    OriginalRow227TriangleRoots06.root196
                else
                  if n < 198 then
                    OriginalRow227TriangleRoots06.root197
                  else
                    OriginalRow227TriangleRoots06.root198
              else
                if n < 201 then
                  if n < 200 then
                    OriginalRow227TriangleRoots06.root199
                  else
                    OriginalRow227TriangleRoots06.root200
                else
                  if n < 202 then
                    OriginalRow227TriangleRoots06.root201
                  else
                    OriginalRow227TriangleRoots06.root202
          else
            if n < 211 then
              if n < 207 then
                if n < 205 then
                  if n < 204 then
                    OriginalRow227TriangleRoots06.root203
                  else
                    OriginalRow227TriangleRoots06.root204
                else
                  if n < 206 then
                    OriginalRow227TriangleRoots06.root205
                  else
                    OriginalRow227TriangleRoots06.root206
              else
                if n < 209 then
                  if n < 208 then
                    OriginalRow227TriangleRoots06.root207
                  else
                    OriginalRow227TriangleRoots06.root208
                else
                  if n < 210 then
                    OriginalRow227TriangleRoots06.root209
                  else
                    OriginalRow227TriangleRoots06.root210
            else
              if n < 215 then
                if n < 213 then
                  if n < 212 then
                    OriginalRow227TriangleRoots06.root211
                  else
                    OriginalRow227TriangleRoots06.root212
                else
                  if n < 214 then
                    OriginalRow227TriangleRoots06.root213
                  else
                    OriginalRow227TriangleRoots06.root214
              else
                if n < 217 then
                  if n < 216 then
                    OriginalRow227TriangleRoots06.root215
                  else
                    OriginalRow227TriangleRoots06.root216
                else
                  if n < 218 then
                    OriginalRow227TriangleRoots06.root217
                  else
                    OriginalRow227TriangleRoots06.root218
        else
          if n < 235 then
            if n < 227 then
              if n < 223 then
                if n < 221 then
                  if n < 220 then
                    OriginalRow227TriangleRoots06.root219
                  else
                    OriginalRow227TriangleRoots06.root220
                else
                  if n < 222 then
                    OriginalRow227TriangleRoots06.root221
                  else
                    OriginalRow227TriangleRoots06.root222
              else
                if n < 225 then
                  if n < 224 then
                    OriginalRow227TriangleRoots06.root223
                  else
                    OriginalRow227TriangleRoots06.root224
                else
                  if n < 226 then
                    OriginalRow227TriangleRoots07.root225
                  else
                    OriginalRow227TriangleRoots07.root226
            else
              if n < 231 then
                if n < 229 then
                  if n < 228 then
                    OriginalRow227TriangleRoots07.root227
                  else
                    OriginalRow227TriangleRoots07.root228
                else
                  if n < 230 then
                    OriginalRow227TriangleRoots07.root229
                  else
                    OriginalRow227TriangleRoots07.root230
              else
                if n < 233 then
                  if n < 232 then
                    OriginalRow227TriangleRoots07.root231
                  else
                    OriginalRow227TriangleRoots07.root232
                else
                  if n < 234 then
                    OriginalRow227TriangleRoots07.root233
                  else
                    OriginalRow227TriangleRoots07.root234
          else
            if n < 243 then
              if n < 239 then
                if n < 237 then
                  if n < 236 then
                    OriginalRow227TriangleRoots07.root235
                  else
                    OriginalRow227TriangleRoots07.root236
                else
                  if n < 238 then
                    OriginalRow227TriangleRoots07.root237
                  else
                    OriginalRow227TriangleRoots07.root238
              else
                if n < 241 then
                  if n < 240 then
                    OriginalRow227TriangleRoots07.root239
                  else
                    OriginalRow227TriangleRoots07.root240
                else
                  if n < 242 then
                    OriginalRow227TriangleRoots07.root241
                  else
                    OriginalRow227TriangleRoots07.root242
            else
              if n < 247 then
                if n < 245 then
                  if n < 244 then
                    OriginalRow227TriangleRoots07.root243
                  else
                    OriginalRow227TriangleRoots07.root244
                else
                  if n < 246 then
                    OriginalRow227TriangleRoots07.root245
                  else
                    OriginalRow227TriangleRoots07.root246
              else
                if n < 249 then
                  if n < 248 then
                    OriginalRow227TriangleRoots07.root247
                  else
                    OriginalRow227TriangleRoots07.root248
                else
                  if n < 250 then
                    OriginalRow227TriangleRoots07.root249
                  else
                    OriginalRow227TriangleRoots07.root250
  else
    if n < 376 then
      if n < 313 then
        if n < 282 then
          if n < 266 then
            if n < 258 then
              if n < 254 then
                if n < 252 then
                  OriginalRow227TriangleRoots07.root251
                else
                  if n < 253 then
                    OriginalRow227TriangleRoots07.root252
                  else
                    OriginalRow227TriangleRoots07.root253
              else
                if n < 256 then
                  if n < 255 then
                    OriginalRow227TriangleRoots07.root254
                  else
                    OriginalRow227TriangleRoots07.root255
                else
                  if n < 257 then
                    OriginalRow227TriangleRoots07.root256
                  else
                    OriginalRow227TriangleRoots08.root257
            else
              if n < 262 then
                if n < 260 then
                  if n < 259 then
                    OriginalRow227TriangleRoots08.root258
                  else
                    OriginalRow227TriangleRoots08.root259
                else
                  if n < 261 then
                    OriginalRow227TriangleRoots08.root260
                  else
                    OriginalRow227TriangleRoots08.root261
              else
                if n < 264 then
                  if n < 263 then
                    OriginalRow227TriangleRoots08.root262
                  else
                    OriginalRow227TriangleRoots08.root263
                else
                  if n < 265 then
                    OriginalRow227TriangleRoots08.root264
                  else
                    OriginalRow227TriangleRoots08.root265
          else
            if n < 274 then
              if n < 270 then
                if n < 268 then
                  if n < 267 then
                    OriginalRow227TriangleRoots08.root266
                  else
                    OriginalRow227TriangleRoots08.root267
                else
                  if n < 269 then
                    OriginalRow227TriangleRoots08.root268
                  else
                    OriginalRow227TriangleRoots08.root269
              else
                if n < 272 then
                  if n < 271 then
                    OriginalRow227TriangleRoots08.root270
                  else
                    OriginalRow227TriangleRoots08.root271
                else
                  if n < 273 then
                    OriginalRow227TriangleRoots08.root272
                  else
                    OriginalRow227TriangleRoots08.root273
            else
              if n < 278 then
                if n < 276 then
                  if n < 275 then
                    OriginalRow227TriangleRoots08.root274
                  else
                    OriginalRow227TriangleRoots08.root275
                else
                  if n < 277 then
                    OriginalRow227TriangleRoots08.root276
                  else
                    OriginalRow227TriangleRoots08.root277
              else
                if n < 280 then
                  if n < 279 then
                    OriginalRow227TriangleRoots08.root278
                  else
                    OriginalRow227TriangleRoots08.root279
                else
                  if n < 281 then
                    OriginalRow227TriangleRoots08.root280
                  else
                    OriginalRow227TriangleRoots08.root281
        else
          if n < 297 then
            if n < 289 then
              if n < 285 then
                if n < 283 then
                  OriginalRow227TriangleRoots08.root282
                else
                  if n < 284 then
                    OriginalRow227TriangleRoots08.root283
                  else
                    OriginalRow227TriangleRoots08.root284
              else
                if n < 287 then
                  if n < 286 then
                    OriginalRow227TriangleRoots08.root285
                  else
                    OriginalRow227TriangleRoots08.root286
                else
                  if n < 288 then
                    OriginalRow227TriangleRoots08.root287
                  else
                    OriginalRow227TriangleRoots08.root288
            else
              if n < 293 then
                if n < 291 then
                  if n < 290 then
                    OriginalRow227TriangleRoots09.root289
                  else
                    OriginalRow227TriangleRoots09.root290
                else
                  if n < 292 then
                    OriginalRow227TriangleRoots09.root291
                  else
                    OriginalRow227TriangleRoots09.root292
              else
                if n < 295 then
                  if n < 294 then
                    OriginalRow227TriangleRoots09.root293
                  else
                    OriginalRow227TriangleRoots09.root294
                else
                  if n < 296 then
                    OriginalRow227TriangleRoots09.root295
                  else
                    OriginalRow227TriangleRoots09.root296
          else
            if n < 305 then
              if n < 301 then
                if n < 299 then
                  if n < 298 then
                    OriginalRow227TriangleRoots09.root297
                  else
                    OriginalRow227TriangleRoots09.root298
                else
                  if n < 300 then
                    OriginalRow227TriangleRoots09.root299
                  else
                    OriginalRow227TriangleRoots09.root300
              else
                if n < 303 then
                  if n < 302 then
                    OriginalRow227TriangleRoots09.root301
                  else
                    OriginalRow227TriangleRoots09.root302
                else
                  if n < 304 then
                    OriginalRow227TriangleRoots09.root303
                  else
                    OriginalRow227TriangleRoots09.root304
            else
              if n < 309 then
                if n < 307 then
                  if n < 306 then
                    OriginalRow227TriangleRoots09.root305
                  else
                    OriginalRow227TriangleRoots09.root306
                else
                  if n < 308 then
                    OriginalRow227TriangleRoots09.root307
                  else
                    OriginalRow227TriangleRoots09.root308
              else
                if n < 311 then
                  if n < 310 then
                    OriginalRow227TriangleRoots09.root309
                  else
                    OriginalRow227TriangleRoots09.root310
                else
                  if n < 312 then
                    OriginalRow227TriangleRoots09.root311
                  else
                    OriginalRow227TriangleRoots09.root312
      else
        if n < 344 then
          if n < 328 then
            if n < 320 then
              if n < 316 then
                if n < 314 then
                  OriginalRow227TriangleRoots09.root313
                else
                  if n < 315 then
                    OriginalRow227TriangleRoots09.root314
                  else
                    OriginalRow227TriangleRoots09.root315
              else
                if n < 318 then
                  if n < 317 then
                    OriginalRow227TriangleRoots09.root316
                  else
                    OriginalRow227TriangleRoots09.root317
                else
                  if n < 319 then
                    OriginalRow227TriangleRoots09.root318
                  else
                    OriginalRow227TriangleRoots09.root319
            else
              if n < 324 then
                if n < 322 then
                  if n < 321 then
                    OriginalRow227TriangleRoots09.root320
                  else
                    OriginalRow227TriangleRoots10.root321
                else
                  if n < 323 then
                    OriginalRow227TriangleRoots10.root322
                  else
                    OriginalRow227TriangleRoots10.root323
              else
                if n < 326 then
                  if n < 325 then
                    OriginalRow227TriangleRoots10.root324
                  else
                    OriginalRow227TriangleRoots10.root325
                else
                  if n < 327 then
                    OriginalRow227TriangleRoots10.root326
                  else
                    OriginalRow227TriangleRoots10.root327
          else
            if n < 336 then
              if n < 332 then
                if n < 330 then
                  if n < 329 then
                    OriginalRow227TriangleRoots10.root328
                  else
                    OriginalRow227TriangleRoots10.root329
                else
                  if n < 331 then
                    OriginalRow227TriangleRoots10.root330
                  else
                    OriginalRow227TriangleRoots10.root331
              else
                if n < 334 then
                  if n < 333 then
                    OriginalRow227TriangleRoots10.root332
                  else
                    OriginalRow227TriangleRoots10.root333
                else
                  if n < 335 then
                    OriginalRow227TriangleRoots10.root334
                  else
                    OriginalRow227TriangleRoots10.root335
            else
              if n < 340 then
                if n < 338 then
                  if n < 337 then
                    OriginalRow227TriangleRoots10.root336
                  else
                    OriginalRow227TriangleRoots10.root337
                else
                  if n < 339 then
                    OriginalRow227TriangleRoots10.root338
                  else
                    OriginalRow227TriangleRoots10.root339
              else
                if n < 342 then
                  if n < 341 then
                    OriginalRow227TriangleRoots10.root340
                  else
                    OriginalRow227TriangleRoots10.root341
                else
                  if n < 343 then
                    OriginalRow227TriangleRoots10.root342
                  else
                    OriginalRow227TriangleRoots10.root343
        else
          if n < 360 then
            if n < 352 then
              if n < 348 then
                if n < 346 then
                  if n < 345 then
                    OriginalRow227TriangleRoots10.root344
                  else
                    OriginalRow227TriangleRoots10.root345
                else
                  if n < 347 then
                    OriginalRow227TriangleRoots10.root346
                  else
                    OriginalRow227TriangleRoots10.root347
              else
                if n < 350 then
                  if n < 349 then
                    OriginalRow227TriangleRoots10.root348
                  else
                    OriginalRow227TriangleRoots10.root349
                else
                  if n < 351 then
                    OriginalRow227TriangleRoots10.root350
                  else
                    OriginalRow227TriangleRoots10.root351
            else
              if n < 356 then
                if n < 354 then
                  if n < 353 then
                    OriginalRow227TriangleRoots10.root352
                  else
                    OriginalRow227TriangleRoots11.root353
                else
                  if n < 355 then
                    OriginalRow227TriangleRoots11.root354
                  else
                    OriginalRow227TriangleRoots11.root355
              else
                if n < 358 then
                  if n < 357 then
                    OriginalRow227TriangleRoots11.root356
                  else
                    OriginalRow227TriangleRoots11.root357
                else
                  if n < 359 then
                    OriginalRow227TriangleRoots11.root358
                  else
                    OriginalRow227TriangleRoots11.root359
          else
            if n < 368 then
              if n < 364 then
                if n < 362 then
                  if n < 361 then
                    OriginalRow227TriangleRoots11.root360
                  else
                    OriginalRow227TriangleRoots11.root361
                else
                  if n < 363 then
                    OriginalRow227TriangleRoots11.root362
                  else
                    OriginalRow227TriangleRoots11.root363
              else
                if n < 366 then
                  if n < 365 then
                    OriginalRow227TriangleRoots11.root364
                  else
                    OriginalRow227TriangleRoots11.root365
                else
                  if n < 367 then
                    OriginalRow227TriangleRoots11.root366
                  else
                    OriginalRow227TriangleRoots11.root367
            else
              if n < 372 then
                if n < 370 then
                  if n < 369 then
                    OriginalRow227TriangleRoots11.root368
                  else
                    OriginalRow227TriangleRoots11.root369
                else
                  if n < 371 then
                    OriginalRow227TriangleRoots11.root370
                  else
                    OriginalRow227TriangleRoots11.root371
              else
                if n < 374 then
                  if n < 373 then
                    OriginalRow227TriangleRoots11.root372
                  else
                    OriginalRow227TriangleRoots11.root373
                else
                  if n < 375 then
                    OriginalRow227TriangleRoots11.root374
                  else
                    OriginalRow227TriangleRoots11.root375
    else
      if n < 439 then
        if n < 407 then
          if n < 391 then
            if n < 383 then
              if n < 379 then
                if n < 377 then
                  OriginalRow227TriangleRoots11.root376
                else
                  if n < 378 then
                    OriginalRow227TriangleRoots11.root377
                  else
                    OriginalRow227TriangleRoots11.root378
              else
                if n < 381 then
                  if n < 380 then
                    OriginalRow227TriangleRoots11.root379
                  else
                    OriginalRow227TriangleRoots11.root380
                else
                  if n < 382 then
                    OriginalRow227TriangleRoots11.root381
                  else
                    OriginalRow227TriangleRoots11.root382
            else
              if n < 387 then
                if n < 385 then
                  if n < 384 then
                    OriginalRow227TriangleRoots11.root383
                  else
                    OriginalRow227TriangleRoots11.root384
                else
                  if n < 386 then
                    OriginalRow227TriangleRoots12.root385
                  else
                    OriginalRow227TriangleRoots12.root386
              else
                if n < 389 then
                  if n < 388 then
                    OriginalRow227TriangleRoots12.root387
                  else
                    OriginalRow227TriangleRoots12.root388
                else
                  if n < 390 then
                    OriginalRow227TriangleRoots12.root389
                  else
                    OriginalRow227TriangleRoots12.root390
          else
            if n < 399 then
              if n < 395 then
                if n < 393 then
                  if n < 392 then
                    OriginalRow227TriangleRoots12.root391
                  else
                    OriginalRow227TriangleRoots12.root392
                else
                  if n < 394 then
                    OriginalRow227TriangleRoots12.root393
                  else
                    OriginalRow227TriangleRoots12.root394
              else
                if n < 397 then
                  if n < 396 then
                    OriginalRow227TriangleRoots12.root395
                  else
                    OriginalRow227TriangleRoots12.root396
                else
                  if n < 398 then
                    OriginalRow227TriangleRoots12.root397
                  else
                    OriginalRow227TriangleRoots12.root398
            else
              if n < 403 then
                if n < 401 then
                  if n < 400 then
                    OriginalRow227TriangleRoots12.root399
                  else
                    OriginalRow227TriangleRoots12.root400
                else
                  if n < 402 then
                    OriginalRow227TriangleRoots12.root401
                  else
                    OriginalRow227TriangleRoots12.root402
              else
                if n < 405 then
                  if n < 404 then
                    OriginalRow227TriangleRoots12.root403
                  else
                    OriginalRow227TriangleRoots12.root404
                else
                  if n < 406 then
                    OriginalRow227TriangleRoots12.root405
                  else
                    OriginalRow227TriangleRoots12.root406
        else
          if n < 423 then
            if n < 415 then
              if n < 411 then
                if n < 409 then
                  if n < 408 then
                    OriginalRow227TriangleRoots12.root407
                  else
                    OriginalRow227TriangleRoots12.root408
                else
                  if n < 410 then
                    OriginalRow227TriangleRoots12.root409
                  else
                    OriginalRow227TriangleRoots12.root410
              else
                if n < 413 then
                  if n < 412 then
                    OriginalRow227TriangleRoots12.root411
                  else
                    OriginalRow227TriangleRoots12.root412
                else
                  if n < 414 then
                    OriginalRow227TriangleRoots12.root413
                  else
                    OriginalRow227TriangleRoots12.root414
            else
              if n < 419 then
                if n < 417 then
                  if n < 416 then
                    OriginalRow227TriangleRoots12.root415
                  else
                    OriginalRow227TriangleRoots12.root416
                else
                  if n < 418 then
                    OriginalRow227TriangleRoots13.root417
                  else
                    OriginalRow227TriangleRoots13.root418
              else
                if n < 421 then
                  if n < 420 then
                    OriginalRow227TriangleRoots13.root419
                  else
                    OriginalRow227TriangleRoots13.root420
                else
                  if n < 422 then
                    OriginalRow227TriangleRoots13.root421
                  else
                    OriginalRow227TriangleRoots13.root422
          else
            if n < 431 then
              if n < 427 then
                if n < 425 then
                  if n < 424 then
                    OriginalRow227TriangleRoots13.root423
                  else
                    OriginalRow227TriangleRoots13.root424
                else
                  if n < 426 then
                    OriginalRow227TriangleRoots13.root425
                  else
                    OriginalRow227TriangleRoots13.root426
              else
                if n < 429 then
                  if n < 428 then
                    OriginalRow227TriangleRoots13.root427
                  else
                    OriginalRow227TriangleRoots13.root428
                else
                  if n < 430 then
                    OriginalRow227TriangleRoots13.root429
                  else
                    OriginalRow227TriangleRoots13.root430
            else
              if n < 435 then
                if n < 433 then
                  if n < 432 then
                    OriginalRow227TriangleRoots13.root431
                  else
                    OriginalRow227TriangleRoots13.root432
                else
                  if n < 434 then
                    OriginalRow227TriangleRoots13.root433
                  else
                    OriginalRow227TriangleRoots13.root434
              else
                if n < 437 then
                  if n < 436 then
                    OriginalRow227TriangleRoots13.root435
                  else
                    OriginalRow227TriangleRoots13.root436
                else
                  if n < 438 then
                    OriginalRow227TriangleRoots13.root437
                  else
                    OriginalRow227TriangleRoots13.root438
      else
        if n < 470 then
          if n < 454 then
            if n < 446 then
              if n < 442 then
                if n < 440 then
                  OriginalRow227TriangleRoots13.root439
                else
                  if n < 441 then
                    OriginalRow227TriangleRoots13.root440
                  else
                    OriginalRow227TriangleRoots13.root441
              else
                if n < 444 then
                  if n < 443 then
                    OriginalRow227TriangleRoots13.root442
                  else
                    OriginalRow227TriangleRoots13.root443
                else
                  if n < 445 then
                    OriginalRow227TriangleRoots13.root444
                  else
                    OriginalRow227TriangleRoots13.root445
            else
              if n < 450 then
                if n < 448 then
                  if n < 447 then
                    OriginalRow227TriangleRoots13.root446
                  else
                    OriginalRow227TriangleRoots13.root447
                else
                  if n < 449 then
                    OriginalRow227TriangleRoots13.root448
                  else
                    OriginalRow227TriangleRoots14.root449
              else
                if n < 452 then
                  if n < 451 then
                    OriginalRow227TriangleRoots14.root450
                  else
                    OriginalRow227TriangleRoots14.root451
                else
                  if n < 453 then
                    OriginalRow227TriangleRoots14.root452
                  else
                    OriginalRow227TriangleRoots14.root453
          else
            if n < 462 then
              if n < 458 then
                if n < 456 then
                  if n < 455 then
                    OriginalRow227TriangleRoots14.root454
                  else
                    OriginalRow227TriangleRoots14.root455
                else
                  if n < 457 then
                    OriginalRow227TriangleRoots14.root456
                  else
                    OriginalRow227TriangleRoots14.root457
              else
                if n < 460 then
                  if n < 459 then
                    OriginalRow227TriangleRoots14.root458
                  else
                    OriginalRow227TriangleRoots14.root459
                else
                  if n < 461 then
                    OriginalRow227TriangleRoots14.root460
                  else
                    OriginalRow227TriangleRoots14.root461
            else
              if n < 466 then
                if n < 464 then
                  if n < 463 then
                    OriginalRow227TriangleRoots14.root462
                  else
                    OriginalRow227TriangleRoots14.root463
                else
                  if n < 465 then
                    OriginalRow227TriangleRoots14.root464
                  else
                    OriginalRow227TriangleRoots14.root465
              else
                if n < 468 then
                  if n < 467 then
                    OriginalRow227TriangleRoots14.root466
                  else
                    OriginalRow227TriangleRoots14.root467
                else
                  if n < 469 then
                    OriginalRow227TriangleRoots14.root468
                  else
                    OriginalRow227TriangleRoots14.root469
        else
          if n < 486 then
            if n < 478 then
              if n < 474 then
                if n < 472 then
                  if n < 471 then
                    OriginalRow227TriangleRoots14.root470
                  else
                    OriginalRow227TriangleRoots14.root471
                else
                  if n < 473 then
                    OriginalRow227TriangleRoots14.root472
                  else
                    OriginalRow227TriangleRoots14.root473
              else
                if n < 476 then
                  if n < 475 then
                    OriginalRow227TriangleRoots14.root474
                  else
                    OriginalRow227TriangleRoots14.root475
                else
                  if n < 477 then
                    OriginalRow227TriangleRoots14.root476
                  else
                    OriginalRow227TriangleRoots14.root477
            else
              if n < 482 then
                if n < 480 then
                  if n < 479 then
                    OriginalRow227TriangleRoots14.root478
                  else
                    OriginalRow227TriangleRoots14.root479
                else
                  if n < 481 then
                    OriginalRow227TriangleRoots14.root480
                  else
                    OriginalRow227TriangleRoots15.root481
              else
                if n < 484 then
                  if n < 483 then
                    OriginalRow227TriangleRoots15.root482
                  else
                    OriginalRow227TriangleRoots15.root483
                else
                  if n < 485 then
                    OriginalRow227TriangleRoots15.root484
                  else
                    OriginalRow227TriangleRoots15.root485
          else
            if n < 494 then
              if n < 490 then
                if n < 488 then
                  if n < 487 then
                    OriginalRow227TriangleRoots15.root486
                  else
                    OriginalRow227TriangleRoots15.root487
                else
                  if n < 489 then
                    OriginalRow227TriangleRoots15.root488
                  else
                    OriginalRow227TriangleRoots15.root489
              else
                if n < 492 then
                  if n < 491 then
                    OriginalRow227TriangleRoots15.root490
                  else
                    OriginalRow227TriangleRoots15.root491
                else
                  if n < 493 then
                    OriginalRow227TriangleRoots15.root492
                  else
                    OriginalRow227TriangleRoots15.root493
            else
              if n < 498 then
                if n < 496 then
                  if n < 495 then
                    OriginalRow227TriangleRoots15.root494
                  else
                    OriginalRow227TriangleRoots15.root495
                else
                  if n < 497 then
                    OriginalRow227TriangleRoots15.root496
                  else
                    OriginalRow227TriangleRoots15.root497
              else
                if n < 500 then
                  if n < 499 then
                    OriginalRow227TriangleRoots15.root498
                  else
                    OriginalRow227TriangleRoots15.root499
                else
                  if n < 501 then
                    OriginalRow227TriangleRoots15.root500
                  else
                    OriginalRow227TriangleRoots15.root501

theorem first : S 1 = OriginalRow227TriangleRoots00.root1 := rfl

theorem last : S 501 = OriginalRow227TriangleRoots15.root501 := rfl

end Grothe.UpperChaos.OriginalRow227RootLookup

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootLookup.first) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootLookup.last) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
