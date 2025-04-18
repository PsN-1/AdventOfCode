//
//  Da7Tests.swift
//  AdventOfCodeTests
//
//  Created by Pedro Neto on 07/12/22.
//

import XCTest
@testable import AdventOfCode

final class Tests22Day7: XCTestCase {
    
        func testExampleDay7() {
            let sut = Solution22Day7()
            let result = sut.runDay7(input: mockInput)
            XCTAssertEqual(result, 24933642)
    
        }
    
        func testDay7() {
            let sut = Solution22Day7()
            let result = sut.runDay7(input: input)
            XCTAssertEqual(result, 272298)
        }
    
    
    
    private let input = """
$ cd /
$ ls
dir plws
dir pwlbgbz
dir pwtpltr
dir szn
$ cd plws
$ ls
dir ffpzc
dir frcmjzts
92461 nbvnzg
dir phqcg
21621 vqgsglwq
$ cd ffpzc
$ ls
48459 dzdfc.vqq
143107 jql.jzl
208330 mmnvqn.hqb
290122 svjvhflz
218008 wjlmgq
$ cd ..
$ cd frcmjzts
$ ls
dir bsltmjz
dir jfzgrbm
$ cd bsltmjz
$ ls
34237 dzdfc.vqq
58741 mdgdhqgw
$ cd ..
$ cd jfzgrbm
$ ls
132811 fcmpng
103661 lgt.swt
173031 vqgsglwq
29134 wprjfg.zbr
$ cd ..
$ cd ..
$ cd phqcg
$ ls
955 jgfs.zjw
$ cd ..
$ cd ..
$ cd pwlbgbz
$ ls
dir gbg
dir mjzhcwrd
dir njcscpj
dir sphbzn
dir tbgjpphc
55938 tvrfpczc.djm
4840 twd
$ cd gbg
$ ls
287003 fcsjl.bzm
dir wgq
$ cd wgq
$ ls
22963 fcsjl.fcm
$ cd ..
$ cd ..
$ cd mjzhcwrd
$ ls
228632 clfnpmbq.zmb
28276 dzdfc.vqq
2982 tdbg.wgn
$ cd ..
$ cd njcscpj
$ ls
dir dqzgqgv
275186 ffpzc
192491 gjnflc.plq
$ cd dqzgqgv
$ ls
70309 dzdfc.vqq
56139 fcsjl
142095 sgwz.cdz
dir snjntth
dir sphbzn
284618 wjlmgq
$ cd snjntth
$ ls
51918 ffpzc
dir vrfgfds
$ cd vrfgfds
$ ls
155233 jlscz
$ cd ..
$ cd ..
$ cd sphbzn
$ ls
dir qbzwrrw
dir qwpzn
$ cd qbzwrrw
$ ls
278531 fcsjl.tqj
211591 snjntth.gpd
$ cd ..
$ cd qwpzn
$ ls
174183 vqgsglwq
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd sphbzn
$ ls
185471 bsltmjz.fqz
dir bsvh
dir fvzcs
dir ndw
dir nlml
dir pcbt
286260 zhcmrpvt
$ cd bsvh
$ ls
130814 wjlmgq
$ cd ..
$ cd fvzcs
$ ls
dir cgmv
dir ggzwljr
298241 qvzghdpw.lms
dir snjntth
dir sphbzn
$ cd cgmv
$ ls
46843 dzdfc.vqq
dir lmqcbbm
dir rstcqsmd
215261 snjntth
$ cd lmqcbbm
$ ls
229898 bdmbvgp
25529 ffpzc.stm
16871 lnpjzvg.qlj
$ cd ..
$ cd rstcqsmd
$ ls
289038 zrbbbwng.smf
$ cd ..
$ cd ..
$ cd ggzwljr
$ ls
198200 bcthn
$ cd ..
$ cd snjntth
$ ls
191672 fwp.phf
68229 hzs.zpg
dir pggcwb
222426 qbv.bwj
dir snjntth
155354 vmqcm
$ cd pggcwb
$ ls
154272 fqztwvnv.lvv
dir pdjg
62393 vqgsglwq
dir wjhrtg
$ cd pdjg
$ ls
260644 gvhlrcf
209906 wpls.pbd
$ cd ..
$ cd wjhrtg
$ ls
148640 dljf.zrq
172168 dzdfc.vqq
196203 hjdphcfm
247620 sgwz.cdz
$ cd ..
$ cd ..
$ cd snjntth
$ ls
37467 ndlshlmj.cjq
257404 snjntth.nsf
$ cd ..
$ cd ..
$ cd sphbzn
$ ls
64082 bfdv.lwv
dir bsltmjz
58942 dzdfc.vqq
dir snjntth
$ cd bsltmjz
$ ls
dir bsqqdr
266007 fcsjl.gfm
dir ffpzc
dir frsmrd
72122 nthnhzwf
286705 wjlmgq
$ cd bsqqdr
$ ls
117496 wcqt
$ cd ..
$ cd ffpzc
$ ls
280224 mmnvqn.hqb
105346 vrr
$ cd ..
$ cd frsmrd
$ ls
111509 sphbzn.shz
$ cd ..
$ cd ..
$ cd snjntth
$ ls
177491 mplj
9029 pvbz.jwn
92891 snjntth.zrv
203356 vnnnw.gql
134728 vqgsglwq
$ cd ..
$ cd ..
$ cd ..
$ cd ndw
$ ls
241303 bht.rpj
173068 vqgsglwq
$ cd ..
$ cd nlml
$ ls
228982 hzglfpvq.ftt
114981 sgwz.cdz
$ cd ..
$ cd pcbt
$ ls
dir bsltmjz
dir ffpzc
dir fjsjwfg
dir fwm
dir jvwt
227943 tmr.jdc
dir vwpqzdwh
31258 wjlmgq
$ cd bsltmjz
$ ls
177750 bsltmjz.spj
dir ffpzc
dir flrpwfs
138824 mtmdtcpv.cfj
165770 wzqwczj.qwn
$ cd ffpzc
$ ls
179645 snjntth.dss
$ cd ..
$ cd flrpwfs
$ ls
60566 wvjq.gmm
$ cd ..
$ cd ..
$ cd ffpzc
$ ls
97847 qzhhtmd.bhw
1197 vqgsglwq
$ cd ..
$ cd fjsjwfg
$ ls
152232 dnsdd.jgz
181301 gsb.wsh
dir jqpb
dir jscbg
dir snjntth
227677 snjntth.vvg
dir sphbzn
75358 vqgsglwq
2589 wjlmgq
$ cd jqpb
$ ls
253403 mmnvqn.hqb
108325 rvq.mrc
$ cd ..
$ cd jscbg
$ ls
dir dtm
dir gsdnz
208269 prh
25977 qdzljgh
169262 vmnq.mth
$ cd dtm
$ ls
80072 gzqnb
$ cd ..
$ cd gsdnz
$ ls
dir dsqzjs
297895 sgwz.cdz
129983 vqgsglwq
$ cd dsqzjs
$ ls
2621 jqrlsf.gzs
164844 snjntth
$ cd ..
$ cd ..
$ cd ..
$ cd snjntth
$ ls
118553 cbhql
dir ffpzc
dir snjntth
$ cd ffpzc
$ ls
dir lmn
12104 tvlwn.vhh
$ cd lmn
$ ls
46401 bsltmjz
96888 shrnqhvq
$ cd ..
$ cd ..
$ cd snjntth
$ ls
dir snjntth
dir vlnfhbq
dir wpwl
$ cd snjntth
$ ls
dir ctj
$ cd ctj
$ ls
82485 fcsjl.lfl
$ cd ..
$ cd ..
$ cd vlnfhbq
$ ls
250106 qvf
$ cd ..
$ cd wpwl
$ ls
153950 cmsd.rlg
$ cd ..
$ cd ..
$ cd ..
$ cd sphbzn
$ ls
dir glgq
$ cd glgq
$ ls
285182 wjlmgq
$ cd ..
$ cd ..
$ cd ..
$ cd fwm
$ ls
251865 ffpzc.qgb
279522 zvvpfqtp
$ cd ..
$ cd jvwt
$ ls
48990 bsltmjz.nzp
219604 ffpzc
69573 mvmdfzr.lwb
$ cd ..
$ cd vwpqzdwh
$ ls
267581 pvcch
$ cd ..
$ cd ..
$ cd ..
$ cd tbgjpphc
$ ls
255571 dstpcgr.tfq
dir fdbwbrpp
dir gjzwh
dir hjvrtjt
dir rhzczj
292888 sgwz.cdz
dir wlzhr
149395 wnfzrqgz.dtn
$ cd fdbwbrpp
$ ls
dir ffpzc
dir qbrth
51164 qprp
dir slpt
117026 sphbzn
295685 vqgsglwq
dir znmj
$ cd ffpzc
$ ls
dir jhnzrdvb
$ cd jhnzrdvb
$ ls
217775 ffpzc.sgw
$ cd ..
$ cd ..
$ cd qbrth
$ ls
183969 lpbwgfjv.vcg
47333 wjlmgq
$ cd ..
$ cd slpt
$ ls
32343 tqhtj.jwz
$ cd ..
$ cd znmj
$ ls
55058 mmnvqn.hqb
$ cd ..
$ cd ..
$ cd gjzwh
$ ls
dir dvcbcd
202530 dzdfc.vqq
dir fsgz
dir hfrrqq
54897 jlzn.qsn
16097 ldzqsbb.jzl
225078 pswccrd
dir rqqmldw
292464 rzrdhbp.vld
dir ssqbqqp
dir zsztqrc
$ cd dvcbcd
$ ls
187837 dzdfc.vqq
dir jlwtvf
dir jnjvshs
164053 nrf.fqd
5665 tlp.jmt
13801 wjlmgq
$ cd jlwtvf
$ ls
219985 sphbzn.dvj
$ cd ..
$ cd jnjvshs
$ ls
dir bsltmjz
dir nrpm
$ cd bsltmjz
$ ls
152972 qgdqj
$ cd ..
$ cd nrpm
$ ls
18509 wjlmgq
$ cd ..
$ cd ..
$ cd ..
$ cd fsgz
$ ls
224576 mmnvqn.hqb
$ cd ..
$ cd hfrrqq
$ ls
dir bwgsnfvb
dir fcsjl
294608 ffpzc.gvm
136880 qjcgtw
dir sphbzn
$ cd bwgsnfvb
$ ls
29735 dzdfc.vqq
dir wstmzfml
$ cd wstmzfml
$ ls
158447 bnvhbvvc.nrt
59889 jclclgd
$ cd ..
$ cd ..
$ cd fcsjl
$ ls
138297 ffpzc.szw
$ cd ..
$ cd sphbzn
$ ls
dir wqdths
$ cd wqdths
$ ls
8326 cgvtw.jpz
$ cd ..
$ cd ..
$ cd ..
$ cd rqqmldw
$ ls
226757 dzdfc.vqq
115055 mwb.btc
dir qpts
298524 sgwz.cdz
$ cd qpts
$ ls
60860 bsltmjz.frp
dir fcsjl
94904 sgwz.cdz
dir wnmqqspz
$ cd fcsjl
$ ls
25082 mmnvqn.hqb
$ cd ..
$ cd wnmqqspz
$ ls
165529 sgwz.cdz
$ cd ..
$ cd ..
$ cd ..
$ cd ssqbqqp
$ ls
192477 pvrgm
$ cd ..
$ cd zsztqrc
$ ls
254053 lht.htn
$ cd ..
$ cd ..
$ cd hjvrtjt
$ ls
189942 fwps
$ cd ..
$ cd rhzczj
$ ls
36502 bmtfr
dir ffjz
35148 nctfhmzm.vsz
dir qdgjzcz
208196 rwql
79863 sgwz.cdz
dir snjntth
$ cd ffjz
$ ls
dir grsvhwm
$ cd grsvhwm
$ ls
50231 fwj.rdv
dir snjntth
$ cd snjntth
$ ls
dir dtbgb
$ cd dtbgb
$ ls
150245 vdflm.lmq
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd qdgjzcz
$ ls
222389 dzdfc.vqq
$ cd ..
$ cd snjntth
$ ls
56794 mmnvqn.hqb
$ cd ..
$ cd ..
$ cd wlzhr
$ ls
116628 bsltmjz
60122 jqpbsgnr.fgb
252605 lfss
300065 qwjdl.vhr
$ cd ..
$ cd ..
$ cd ..
$ cd pwtpltr
$ ls
dir dplsvrhl
140951 gwtfzqvd.znb
dir jbvdb
dir jst
dir qhjv
dir snjntth
$ cd dplsvrhl
$ ls
272101 fcsjl
dir ffpzc
58852 mmnvqn.hqb
dir mnhntjz
91899 sgwz.cdz
228077 snjntth.btv
$ cd ffpzc
$ ls
5499 bsltmjz
dir qmfwpjhl
dir rsrb
dir wgt
$ cd qmfwpjhl
$ ls
300362 dzdfc.vqq
$ cd ..
$ cd rsrb
$ ls
252983 dzdfc.vqq
107744 ltssrgqb.zvj
214895 rhglgcwr.wpw
249727 sgwz.cdz
$ cd ..
$ cd wgt
$ ls
141984 dzdfc.vqq
194686 mmnvqn.hqb
258023 pgr
$ cd ..
$ cd ..
$ cd mnhntjz
$ ls
dir bdvght
dir jprwchh
dir snjntth
$ cd bdvght
$ ls
243166 vpsvjdq.wsn
$ cd ..
$ cd jprwchh
$ ls
178943 bmpc.bjb
$ cd ..
$ cd snjntth
$ ls
dir nlbm
dir zjmjntff
$ cd nlbm
$ ls
33050 fcsjl.rcc
dir sphbzn
17446 wjlmgq
$ cd sphbzn
$ ls
214563 prrfhff.pbp
$ cd ..
$ cd ..
$ cd zjmjntff
$ ls
82134 sgwz.cdz
52203 vrtlgdq.crp
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd jbvdb
$ ls
dir wmtjh
$ cd wmtjh
$ ls
dir ggvwn
$ cd ggvwn
$ ls
192285 spqvmf.sdh
$ cd ..
$ cd ..
$ cd ..
$ cd jst
$ ls
dir bsltmjz
212740 dzdfc.vqq
dir gncztvtb
dir jsqjcqnt
286257 jvs
36654 sdcsm.mbg
192040 sgwz.cdz
dir tbqphzb
dir vdcqgts
285843 wjlmgq
$ cd bsltmjz
$ ls
215705 snjntth.gpv
213665 wjlmgq
$ cd ..
$ cd gncztvtb
$ ls
229298 vqgsglwq
$ cd ..
$ cd jsqjcqnt
$ ls
dir bsltmjz
dir fcsjl
dir ffpzc
dir sphbzn
70864 vqgsglwq
$ cd bsltmjz
$ ls
14981 pqzffzjc
$ cd ..
$ cd fcsjl
$ ls
140328 jwhczwbc
$ cd ..
$ cd ffpzc
$ ls
213650 mmnvqn.hqb
$ cd ..
$ cd sphbzn
$ ls
dir psmtphhq
dir sphbzn
$ cd psmtphhq
$ ls
dir ffpzc
123131 tzgwd
$ cd ffpzc
$ ls
49737 cfngvmd
dir gcnrp
172799 gmd.cwl
dir llnztjf
dir nbqs
79661 rrqz
$ cd gcnrp
$ ls
283 vqnrgl.vwp
$ cd ..
$ cd llnztjf
$ ls
63263 tjhm.bwh
$ cd ..
$ cd nbqs
$ ls
dir vssmq
$ cd vssmq
$ ls
88980 dzdfc.vqq
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd sphbzn
$ ls
20140 fcsjl.zrs
260579 snjntth
$ cd ..
$ cd ..
$ cd ..
$ cd tbqphzb
$ ls
93470 sgwz.cdz
$ cd ..
$ cd vdcqgts
$ ls
223564 dzdfc.vqq
dir ffpzc
dir gwhfgwf
dir nbjtqnng
dir snjntth
$ cd ffpzc
$ ls
42813 qwwmw.nmt
$ cd ..
$ cd gwhfgwf
$ ls
59918 jvfv.mpm
dir mjl
211039 pcwl
$ cd mjl
$ ls
13004 pgjb.tpq
195995 tms.fjz
$ cd ..
$ cd ..
$ cd nbjtqnng
$ ls
107058 dzdfc.vqq
dir ldrsd
111631 vqgsglwq
104599 wbzmdljw.tjq
155747 wjlmgq
$ cd ldrsd
$ ls
107439 jvjm
$ cd ..
$ cd ..
$ cd snjntth
$ ls
242680 fgrt.gng
$ cd ..
$ cd ..
$ cd ..
$ cd qhjv
$ ls
dir bmnm
68453 hjjpdgn.hwl
dir sjlbj
dir vqnrj
$ cd bmnm
$ ls
1238 vqgsglwq
$ cd ..
$ cd sjlbj
$ ls
44239 wzzbtmrz.gml
$ cd ..
$ cd vqnrj
$ ls
3286 bsltmjz.qlc
$ cd ..
$ cd ..
$ cd snjntth
$ ls
130833 blm.wmt
dir snjntth
dir tcnmbcgg
218869 wjlmgq
$ cd snjntth
$ ls
dir snmrdfbt
$ cd snmrdfbt
$ ls
281025 bzrsds.lfg
$ cd ..
$ cd ..
$ cd tcnmbcgg
$ ls
194998 fcsjl
dir qdrmpqgn
dir rzqd
dir tcsds
$ cd qdrmpqgn
$ ls
165713 qmzgt.tnc
$ cd ..
$ cd rzqd
$ ls
dir cwhnmlv
57819 fcsjl
246864 pjnzdvd.gjm
$ cd cwhnmlv
$ ls
287539 mmnvqn.hqb
215636 pbnjt.zbn
124638 sqd
$ cd ..
$ cd ..
$ cd tcsds
$ ls
78812 gfmgb.wqj
218987 hnhfvz.dln
209640 mzzhqlq.zqp
102492 nml.ppg
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd szn
$ ls
dir fcsjl
dir snjntth
dir zjbp
$ cd fcsjl
$ ls
158019 jsv.pmz
$ cd ..
$ cd snjntth
$ ls
229510 dfvpvp
191061 fgplbptq.jlt
dir lfb
234911 lfsrwr.wcb
dir lrfcgzl
48031 stbbw
219691 vqgsglwq
dir zshh
$ cd lfb
$ ls
dir btj
99591 dhrjbvvg.gwm
137224 dzdfc.vqq
201972 jtzmqsvj.wnd
9704 mmnvqn.hqb
dir pwg
200308 snjntth.css
dir wcmhcfm
dir zwhvmln
$ cd btj
$ ls
dir rnbzdfgn
51799 wdhsm
dir wvf
$ cd rnbzdfgn
$ ls
117095 bsltmjz.tlv
$ cd ..
$ cd wvf
$ ls
dir ffpzc
dir ncbmgpsc
dir wtwrmjnt
$ cd ffpzc
$ ls
249919 lsth.fmf
$ cd ..
$ cd ncbmgpsc
$ ls
147899 dzdfc.vqq
$ cd ..
$ cd wtwrmjnt
$ ls
252366 pvpdv.jwz
$ cd ..
$ cd ..
$ cd ..
$ cd pwg
$ ls
280845 fcsjl.fjz
44300 sgwz.cdz
dir snjntth
229605 vqgsglwq
$ cd snjntth
$ ls
2053 pflvsnzs
143522 sgwz.cdz
$ cd ..
$ cd ..
$ cd wcmhcfm
$ ls
229329 qsznhwlw.vjg
$ cd ..
$ cd zwhvmln
$ ls
dir ffpzc
dir tjjzbf
dir wzcq
$ cd ffpzc
$ ls
dir ncnj
37497 vqgsglwq
$ cd ncnj
$ ls
40920 htbjhjq
$ cd ..
$ cd ..
$ cd tjjzbf
$ ls
47522 mczn.spd
$ cd ..
$ cd wzcq
$ ls
56662 ffpzc.vwp
dir snjntth
$ cd snjntth
$ ls
117276 wjlmgq
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd lrfcgzl
$ ls
267485 rsjmpph.qqz
$ cd ..
$ cd zshh
$ ls
dir ffpzc
dir gmn
dir snjntth
150048 tgtlh
32020 thfr
72152 vqgsglwq
$ cd ffpzc
$ ls
dir snjntth
$ cd snjntth
$ ls
224945 dpfpz
$ cd ..
$ cd ..
$ cd gmn
$ ls
238996 sgwz.cdz
$ cd ..
$ cd snjntth
$ ls
86775 dzdfc.vqq
19560 vshcmjj
$ cd ..
$ cd ..
$ cd ..
$ cd zjbp
$ ls
dir fcsjl
41522 nlvpb.fpf
dir nmtjtd
$ cd fcsjl
$ ls
276802 fcsjl.psm
197934 sgwz.cdz
$ cd ..
$ cd nmtjtd
$ ls
47477 dvqmqlgw.ths
51081 vqgsglwq
"""
    
    
    fileprivate let mockInput = """
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
"""
}
