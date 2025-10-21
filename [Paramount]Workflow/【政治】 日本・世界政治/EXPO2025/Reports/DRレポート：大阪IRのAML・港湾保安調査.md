# 大阪IRのネクサス：AML・港湾保安における法的脆弱性の構造分析

## 第1章 エグゼクティブ・サマリー

本報告書は、大阪・夢洲に計画されている統合型リゾート（IR）をめぐる、アンチ・マネー・ロンダリング（AML）および港湾保安体制に内在する法的・運用上の脆弱性を網羅的に分析するものである。調査の結果、日本のIR規制は、諸外国の失敗事例から学び、一見すると堅牢な枠組みを構築しているものの、その実効性を揺るがしかねない深刻な構造的欠陥が存在することが明らかになった。

主要な発見事項は以下の通りである。

1. **規制の「外観と実態」の乖離**: 日本のIR規制は、犯罪収益移転防止法（犯収法）の枠組みにカジノ事業者を組み込み、さらに100万円超の現金取引報告義務といった独自の厳格な規制を上乗せしている。しかし、その監督を担うカジノ管理委員会（JCRC）の職員に民間監査法人からの出向者が在籍し、元の法人に籍を置いたまま勤務している実態が指摘されており、規制当局の独立性に深刻な疑念が生じている。これは、法の条文の堅牢さとは裏腹に、執行段階での「骨抜き」を可能にする重大なリスクである。
    
2. **「管轄の継ぎ目」という最弱リンク**: 最大の脆弱性は、IR施設内部のAML監視体制と、夢洲という国際港湾における保安・税関体制との間にある「管轄の継ぎ目」に存在する。港湾保安（ISPSコード）、税関（CIQ）、警察、そしてカジノ管理委員会の各組織は、それぞれ異なる法体系と指揮系統の下で縦割りに行動しており、相互のデータ連携は法的に義務付けられていない。この情報の分断は、各機関の監視を個別にすり抜ける洗練された犯罪計画に悪用される恐れが極めて高い。
    
3. **国際比較からの教訓**: マカオのジャンケット（VIP顧客の斡旋業者）モデルの崩壊、フィリピンにおけるバングラデシュ銀行資金洗浄事件は、規制の枠外に置かれたセクターがいかに容易に犯罪の温床となるかを示している。日本はこれらの教訓からジャンケットの主要業務を禁止したが、VIP顧客を誘致する「代理店」の存在を認めており、この代理店がオフショアの資金移動に関与する新たな抜け穴となるリスクが残る。シンガポールの成功モデルは、規制当局の強力な法執行能力と独立性がいかに重要であるかを証明している。
    
4. **意図された脆弱性の可能性**: これらの法的・運用上の「隙間」は、単なる見落としではなく、IRプロジェクトの収益性を最大化するために意図的に残されている可能性が示唆される。IR推進の中核を担う政治勢力の資金調達構造と、事業者であるMGM・オリックス連合の政治的関与は、規制の厳格化よりも事業の成功を優先するインセンティブ構造の存在を浮き彫りにする。
    

本報告書は、これらの脆弱性の因果構造を解明し、法体系と監督機関の責任の所在を特定するとともに、制度の実効性を確保するための具体的な政策提言を行うものである。

## 第2章 日本における統合型リゾートとAMLの規制アーキテクチャ

日本のIR規制は、国際的なベストプラクティスを参考にしつつ、独自の規制を織り交ぜた複雑な構造を持つ。その法的枠組みを解剖し、「あるべき姿」と「現実の運用」の間に潜むリスクを分析する。

### 2.1 IR整備法（特定複合観光施設区域整備法）：範囲と義務の定義

特定複合観光施設区域整備法（以下、IR整備法）は、日本のIRの法的土台を築くものである。同法はIRを、カジノ施設と国際会議場、展示場、ホテル等の施設群で構成され、民間事業者によって一体的に運営されるものと定義している 。法律の目的は、健全なカジノ事業の収益を観光振興や地域経済の活性化、さらには財政改善に活用することにある 。  

この構造は、収益の最大化という事業目標と、厳格でコストのかかるAML規制の実施という公的目標との間に、本質的な緊張関係を生む。法律は、このバランスを取るため、内閣府の外局として独立したカジノ管理委員会（JCRC）を設置し、「健全なカジノ事業」を監督させる仕組みを設けている 。  

### 2.2 犯罪収益移転防止法（犯収法）：「金融機関並み」という神話

IR整備法と連動し、犯収法が改正され、カジノ事業者は金融機関などと同様の「特定事業者」に指定された 。これにより、カジノ事業者は法的に以下の主要なAML義務を負うことになった。  

- **取引時確認（本人確認）**: 顧客との特定の取引に際し、身元などを確認する義務 。  
    
- **記録作成・保存**: 取引記録や本人確認記録を作成し、7年間保存する義務 。  
    
- **疑わしい取引の届出（STR）**: マネー・ロンダリングが疑われる取引を、監督官庁であるカジノ管理委員会に届け出る義務 。  
    

これによりカジノは国内のAML規制の枠組みに組み込まれたが、これが直ちに「金融機関並み」の堅牢性を持つことを意味するわけではない。金融機関は、金融庁（FSA）の厳格な監督の下、数十年にわたる経験と洗練された取引モニタリングシステムを蓄積している 。新設のカジノ事業者と規制当局であるJCRCが、短期間で同レベルの成熟度に達することは現実的ではない。この経験とノウハウの差が、初期段階における脆弱性となりうる。  

犯収法は取引時確認の対象となる取引に敷居値（例：特定の取引で30万円超）を設けているが 、日本のIR規制はこれに加えて、独自の「上乗せ規制」を導入した。IR整備法により、カジノ事業者は顧客との間で100万円を超える現金の授受を伴う取引を行った場合、その全てをJCRCに届け出ることが義務付けられた。JCRCはこの情報を国家公安委員会に通知する 。これは、国際的な基準を超える日本独自の厳格な措置であり、制度設計上の重要な特徴である。  

### 2.3 カジノ管理委員会（JCRC）：権限と現実

JCRCは、事業者への免許付与、規則制定、そして職員の常駐監視を含む継続的な監督を担う、IR規制の中核機関として設立された 。その権限は強力で、事業者本体だけでなく、その役員、主要株主、さらには重要な契約先に至るまで、徹底的な「背面調査」を行う権能を持つ 。また、事業者が策定する内部の「犯罪収益移転防止規程」を審査し、認可する役割も担う 。  

この制度設計は一見、非常に堅牢である。しかし、その実効性を根底から揺るがす重大な脆弱性が存在する。国会質疑において、JCRC事務局の職員には、民間の大手監査法人から出向してきた人物が含まれ、彼らが元の監査法人に籍を置いたまま非常勤の国家公務員として勤務している実態が明らかになった 。これは、規制する側とされる側の癒着や「規制の虜」を招きかねない深刻な利益相反のリスクを示唆する。規制当局の独立性が担保されていなければ、いかに強力な権限が法律で与えられていても、その行使が手心を加えられる恐れがある。  

### 2.4 義務付けられた監査制度：独立性への問い

IR整備法および関連省令は、多層的な監査体制を義務付けている。

1. **業務監査**: IR事業者は監査人（監査役等）を設置し、事業運営全般について監査を行い、監査報告書を作成しなければならない 。  
    
2. **会計監査**: 財務報告書や内部統制報告書については、事業者と利害関係のない独立した公認会計士または監査法人の監査証明を受けることが義務付けられている 。  
    
3. **カジノ粗収益監査**: カジノの売上（粗収益）の集計状況についても、定期的に独立した公認会計士または監査法人の監査を受けなければならない 。  
    

法文上は、業務の適正性と財務の透明性を確保するための包括的な監査制度が整備されているように見える 。しかし、ここでも問題は監査制度の存在そのものではなく、その実効性にある。前述の通り、規制当局であるJCRC自体の独立性に疑義がある場合、これらの監査結果を監督・評価するピラミッドの頂点が揺らぐことになる。監査が形式的なものに終わり、不正が見逃されるリスクが高まる。システムの健全性は、監査人の徹底した独立性と、それを監督するJCRCの完全な中立性にかかっている。  

## 第3章 夢洲フロンティア：港湾保安、税関、そして統合の挑戦

IRが国際的な交通の結節点である港湾に設置されることは、物理的な境界と管轄の境界が交差する、特有の脆弱性を生み出す。このセクションでは、IRと港湾の接点におけるリスクを分析する。

### 3.1 大阪港の港湾保安：ISPSコードの枠組み

国際的な海上保安の基準である「ISPSコード（International Ship and Port Facility Security Code）」は、日本の国内法を通じて実施されており、夢洲のような国際埠頭を持つ港湾施設に適用される 。このコードは、テロ等の脅威レベルに応じて3段階の保安レベルを設定し、アクセス管理、人・車両・貨物の検査、監視体制の強化などを義務付けている 。2025年の大阪・関西万博開催を控え、夢洲周辺では既に自家用車の乗り入れ制限、大型手荷物の持ち込み禁止、ドローン飛行禁止といった厳しい保安措置が講じられており、これがIR開業後も一定の保安水準の基礎となる 。  

しかし、ISPSコードは本質的に、武器や爆発物の密輸といった物理的な脅威やテロ行為の防止を主眼としている 。マネー・ロンダリングのような金融犯罪そのものを直接の対象とはしていない。つまり、人やモノの物理的な移動は厳しく管理されても、それに付随する金融的な情報までが一体的に監視されるわけではない。  

### 3.2 CIQ（税関・出入国管理・検疫）と人流監視

夢洲のような国際港湾には、当然ながら税関（Customs）、出入国管理（Immigration）、検疫（Quarantine）から成るCIQ体制が敷かれる 。特に税関は、電子申告ゲートにおいて顔認証技術を用いて本人確認を行うなど、テクノロジーを活用した水際対策を進めている 。税関の役割は、持ち込み禁止品や多額の現金の不法な持ち込み・持ち出しを摘発することである。  

ここでの脆弱性は、港で得られる情報とカジノで得られる情報の断絶にある。例えば、VIP顧客がプライベートジェットやクルーザーで夢洲の専用ターミナルに到着し、税関を通過してIRに入場するケースを想定する。税関は、その人物の入国情報や手荷物の内容を記録する。その後、その人物がカジノ内でどのような金融取引を行うかという情報は、IR事業者とJCRCが管理する。これら二つの重要なデータセットは、別々の組織によって、別々の目的で収集・管理され、一つの「金の流れ」として統合される仕組みが存在しない。

### 3.3 データ連携の断絶：繋がらない点と点

この問題点を最も象徴的に示すのが、国土交通省が公表した港湾のサイバーセキュリティに関する報告書である 。この報告書は、港湾管理者、重要インフラ事業者、都道府県警察、国の機関などが平時から情報共有を行うための会議体（協議会）を設置することが「望ましい」と提言している。また、既存の会議体を活用することも「有用である」と述べている。  

この「望ましい」「有用」という表現は、裏を返せば、省庁間の横断的な情報共有が法的に義務付けられておらず、制度として確立されていないことの証左である。名古屋港でのサイバー攻撃の際には、日頃からの人間関係が円滑な対応に繋がったと評価されているが、これは個人の努力に依存するアドホックな連携であり、持続可能で堅牢なシステムとは言えない 。依頼者が指摘した「データ連携は条例で阻害されている」可能性は、まさにこの制度的欠陥を的確に捉えている。各組織はそれぞれの管轄内で閉じた情報を持ち、デフォルトの状態が「情報のサイロ化」なのである。犯罪者はこの分断を突き、各組織に対しては合法的に見える断片的な行動を組み合わせることで、全体として見れば違法な目的を達成することが可能になる。  

## 第4章 国際ベンチマークと教訓：比較分析

諸外国がIRやカジノの規制でどのような成功と失敗を経験してきたかを検証することは、大阪モデルのリスクを評価する上で不可欠な視点を提供する。

### 4.1 マカオ：ジャンケットモデルの崩壊とその後

- **失敗事例**: マカオ最大のジャンケット事業者であったサンシティ（太陽城）グループが、大規模な犯罪組織であったことが発覚した事件は象徴的である 。彼らの手口の中心は「賭底面（ドゥーダイミン）」と呼ばれる、正規の売上に計上されない裏賭博であり、これにより政府の税収を免れながら巨額の利益を上げ、大規模なマネー・ロンダリングを行っていた 。  
    
- **規制対応**: この事件を契機に、マカオ政府はカジノ法を抜本的に改正。ジャンケットに対する規制を劇的に強化し、ライセンス数をピーク時の200以上から2024年にはわずか18にまで激減させた 。新法では、ジャンケットが受け取る手数料に上限を設け、これに課税し、カジノの収益分配や顧客への信用供与を禁止するなど、その影響力を徹底的に削ぐ内容となっている 。これは、ジャンケット主導のVIPモデルから、カジノ運営事業者（コンセッショネア）が直接管理するモデルへの歴史的な転換を意味する。  
    
- **日本への教訓**: 規制の緩いジャンケットシステムがいかに危険であるかを明確に示している。日本がIR整備法において、ジャンケットの主要業務である貸付や賭博テーブルの運営を禁止したこと は、マカオの失敗から学んだ直接的な教訓と言える。  
    

### 4.2 シンガポール：「ゴールドスタンダード」と評される規制モデル

- **成功事例**: シンガポールは、2006年のカジノ管理法（Casino Control Act）制定当初から、非常に厳格で包括的な規制枠組みを構築した 。規制当局（現在はGRA: Gambling Regulatory Authority）は内務省傘下の強力な法執行機関として位置づけられている 。  
    
- **ジャンケット規制**: シンガポールはジャンケットを禁止するのではなく、「国際市場エージェント（IMA）」として厳格なライセンス制度とAML管理下に置いた 。特に重要なのは、自国民や永住権保持者への信用供与を禁止した点であり 、これによりジャンケットが持つ最大の弊害を未然に防いだ。  
    
- **社会的セーフガード**: 自国民と永住権保持者に対して高額な入場料（Levy）を課し、入場排除制度を導入するなど、依存症対策にも力を入れている 。  
    
- **日本への教訓**: 際限のない収益成長よりも、システムの健全性（Integrity）を優先する国家主導の管理モデルの有効性を示している。日本は強力な規制機関の設置や入場料制度 など、その要素を模倣しているが、真の課題は執行の厳格さにある。  
    

### 4.3 フィリピン：事件後に対応した法制度

- **失敗事例**: 2016年に発生したバングラデシュ銀行サイバー強盗事件では、ハッカーによって盗まれた8100万ドルがフィリピンの銀行システムを経由し、最終的に同国のカジノを通じて洗浄された 。事件当時、フィリピンの資金洗浄対策法（AMLA）ではカジノが規制対象の「報告義務者」に含まれておらず、不正資金にとって完璧なブラックホールとなっていた。  
    
- **規制対応**: この事件とFATF（金融活動作業部会）からの国際的な圧力を受け、フィリピンは2017年に法改正（共和国法10927号）を行い、カジノを明確にAMLAの規制対象に加え、高額取引や疑わしい取引の報告を義務付けた 。  
    
- **日本への教訓**: 特定のセクターを国のAML枠組みから除外した場合に何が起こるかを示す、極めて明確な警告である。日本は、当初からカジノ事業者を犯収法の対象とすることで、この特定のリスクは回避している 。  
    

### 4.4 韓国：外国人専用モデル

- **規制モデル**: 江原ランドを除き、韓国のカジノはすべて外国人専用として運営されている 。これは国内のギャンブル依存症問題を単純化する効果はあるが、AMLリスクをなくすものではない。  
    
- **管理体制**: 規制の中心は、外国パスポートによる厳格な入場管理 や、場内での服装規定、撮影禁止といった基本的な秩序維持に置かれているように見受けられ、シンガポールや日本が目指すような複雑な金融AML体制とは一線を画す 。  
    
- **日本への教訓**: 日本は、厳しい制限付きで自国民の入場も認めるハイブリッドモデルを選択した。これは、国内の依存症対策と、国際的なマネー・ロンダリング対策という二つの複雑な課題に同時に直面することを意味し、韓国モデルよりも高度な規制能力が求められる。
    

### 表1：主要国におけるAML・ジャンケット規制の比較分析

|管轄区域|主要法規制・監督機関|STR/CTR報告義務|ジャンケット/代理店規制|主要なAML失敗事例|失敗後の改革|
|---|---|---|---|---|---|
|**日本 (計画)**|IR整備法、犯収法 / カジノ管理委員会|STR報告義務あり。100万円超の現金取引は全件報告義務 (CTR)|主要業務 (貸付、テーブル運営) は禁止。誘客等の代理店契約は認可制|-|-|
|**マカオ**|カジノ法 / ゲーミング監察協調局 (DICJ)|STR報告義務あり。|規制緩和されたジャンケットがVIP市場を支配。信用供与、収益分配が一般的だった。|サンシティ事件：ジャンケットが大規模な裏賭博と資金洗浄に関与|カジノ法改正。ジャンケットのライセンスを大幅削減し、信用供与や収益分配を禁止|
|**シンガポール**|カジノ管理法 / ギャンブル規制庁 (GRA)|STR/CTR報告義務あり。|「国際市場エージェント (IMA)」として厳格なライセンス制。自国民への信用供与は禁止|重大な公開事例はなし。|定期的な法改正により規制を強化 (2012年、2022年)|
|**フィリピン**|資金洗浄対策法 (AMLA) / AMLC, PAGCOR|STR/CTR報告義務あり (2017年以降)|ライセンス制。|バングラデシュ銀行事件：当時AML法の対象外だったカジノが資金洗浄に利用される|法改正によりカジノをAML法の対象事業者に追加|

## 第5章 大阪IR構造における体系的脆弱性の分析

これまでの分析を踏まえ、大阪IRの構造に内在する具体的な脆弱性（ギャップ）を特定し、その悪用シナリオを検討する。

### 5.1 ギャップ分析1：管轄の継ぎ目

この脆弱性は、第3章で詳述した、港湾・税関の監督体制とIR内部のAML管理体制との間の断絶に起因する。

- **悪用シナリオ**: 高リスク国籍の人物がプライベートヨットで夢洲に到着。税関での手荷物検査と本人確認は問題なく通過する。その後、IRに入場し、100万円の現金取引報告義務の敷居値をわずかに下回る90万円のチップ購入を、異なる日、異なる窓口で複数回繰り返す。あるいは、複数の仲間と資金を分散させる。個々の取引は、IR事業者のシステムが自動的にSTRを発報する基準には達しないかもしれない。JCRCはカジノ内の金融活動しか見ておらず、税関は入国時の情報しか持っていない。両者の情報が統合されない限り、この人物の行動全体が持つ高いリスクを誰も把握できない。このシナリオを可能にするのが、省庁間のデータ共有を義務付けていない現行制度である 。  
    

### 5.2 ギャップ分析2：「ジャンケット」の死角とVIPチャネル

IR整備法は、貸付やテーブル運営といったジャンケットの中核業務を禁止している 。しかし、カジノ事業者が顧客へのマーケティングやサービス提供（いわゆる「コンプ」）のために外部の代理店と契約することは、JCRCの認可を条件に認められている 。  

- **死角**: 規制の焦点は、IR事業者と代理店との間の「公式な契約」に置かれている。しかし、真のリスクは、これらの代理店とそのVIP顧客との間の、特に依頼者が指摘する「中国人客の外貨需要」に応えるための「非公式な、あるいは申告されない関係」に潜んでいる。例えば、認可された代理店が、顧客のギャンブル資金を調達するため、日本国外で運営される非公式な価値移転システム（地下銀行など）を利用する可能性がある。この場合、資金はカジノの公式な窓口を経由せず、AMLチェックを完全に回避する。これは、マカオで見られた「賭底面」と同様の、規制の枠外で資金を動かす手口である 。  
    
- **根本原因**: 中国の厳格な資本規制がこの需要を生み出している。富裕層が多額の資金を国外に持ち出してギャンブルを行うには、非合法な手段に頼らざるを得ない場合がある。日本の規制は、国内でのジャンケット行為は禁じているが、このような国境を越えた洗練された金融スキームを警察・摘発する能力は未知数である。
    

### 5.3 ギャップ分析3：監督と透明性の実効性

この脆弱性は、規制が形骸化し、説明責任が果たされない「規制の虜」のリスクに関するものである。

- **リスクの証拠**:
    
    - 規制当局であるJCRC内部に、監査対象となりうる業界と関係の深い民間監査法人からの出向者が存在する、潜在的な利益相反の問題 。  
        
    - 大阪府・市が、IR事業者との間で締結した「実施協定」の全文を公開せず、概要のみを公表しているという透明性の欠如 。全文へのアクセスは困難な状況にある 。  
        
    - 市民団体などから、IR事業者の透明性の低さや運営主体としての適格性について、強い懸念が表明されていること 。  
        
- **示唆されること**: 独立性に疑義のある規制当局と、透明性を欠く事業者の組み合わせは、規則が歪められたり、破られたりしても、外部からの発見や追及が困難な環境を生み出す。いかに完璧な法律も、独立性と厳格さ、そして透明性を備えた機関によって執行されなければ意味をなさない。
    

## 第6章 因果関係と組織的説明責任

依頼者の「意図的な不備」という仮説に踏み込み、脆弱性が生まれる背景にある政治的・経済的構造と、その責任の所在を明らかにする。

### 6.1 大阪IRの政治経済学

- **日本維新の会**: 大阪IRを強力に推進する中心的政治勢力である。同党の政治資金は、企業・団体によるパーティー券の大量購入に支えられる大規模な政治資金パーティーに大きく依存しており、これは「形を変えた企業・団体献金」と指摘されている 。収入の内訳は、パーティー収入と政党助成金が大部分を占める 。また、その収支報告書の記載に誤りがあり、訂正した事例も報告されている 。  
    
- **大阪IR株式会社の株主**: 事業主体は、米国のカジノ大手MGMリゾーツ・インターナショナルと、日本の大手金融サービス企業オリックス株式会社のコンソーシアムである 。  
    
    - **MGM**: ビル・ホーンバックルCEOらが主導するグローバル企業であり 、日本法人代表には元駐日米国代理大使のジェイソン・ハイランド氏を起用するなど、日本の政官界への深い食い込みを狙う戦略が見て取れる 。  
        
    - **オリックス**: 公式な行動指針では政治献金を否定しているが 、株主総会の質疑応答では、政治資金パーティー券を少額ながら購入していることを認めている 。  
        
- **分析**: これは直接的な汚職の証拠ではない。しかし、明確な政治・経済のエコシステムを形成している。企業パーティーに財政を依存する政党（維新）が、政治的アクセスを重視する巨大コンソーシアム（MGM/オリックス）のための数兆円規模のプロジェクトを推進している。この構図は、プロジェクトの金融的成功を最優先する強力なインセンティブ構造を生み出す。この文脈において、過度に厳格で煩雑な規制がVIP顧客を遠ざけ、収益性を損なうことを避けるために、法的な「抜け穴」が「意図的に残された」のではないかという依頼者の仮説は、一定の合理性を持つ。それは、あからさまな違法行為ではなく、「紙の上では厳格だが、運用には柔軟性がある」という、絶妙なバランスを狙った結果である可能性がある。
    

### 6.2 因果構造のマッピング：誰がギャップを見逃しているのか

特定された脆弱性について、どの法体系がそれを許容し、どの組織がその監督責任を負っているのかを以下に整理する。

- **ギャップ1（管轄の継ぎ目）**: 責任は複数の組織に分散している。IR整備法において省庁間のデータ連携を義務付けなかった**国会**。統合されたデータプロトコルを構築してこなかった**国土交通省（港湾局）**、**財務省（税関）**、**警察庁**。そして、免許付与の条件としてこの連携を強く要求しなかった**カジノ管理委員会**。
    
- **ギャップ2（VIPの死角）**: 主たる責任は**カジノ管理委員会**にある。代理店に対する規制は、オフショアでの資金洗浄スキームを検知・抑止できるほど高度でなければならない。また、JCRCがそのような国境を越えた調査を行うための法的権限とリソースを十分に与えなかった**国会**にも二次的な責任がある。
    
- **ギャップ3（監督の実効性）**: 内部の利益相反リスクに対する責任は**カジノ管理委員会**自身にある。実施協定の透明性欠如については、**大阪府・大阪市**が責任を負う。
    

### 表2：大阪IRの脆弱性に関する因果構造と説明責任マトリクス

|脆弱性|関連する法的枠組み（またはその欠如）|主たる責任組織|副次的・協力組織|根拠資料|
|---|---|---|---|---|
|**管轄区域間のデータ連携の断絶**|IR整備法に省庁間データ連携の義務規定なし。各省庁の設置法に基づく縦割り行政。|国土交通省、財務省（税関）、警察庁|カジノ管理委員会、国会||
|**VIP代理店を通じたAMLリスク**|IR整備法 第91条（業務の委託）で代理店契約は認可制だが、代理店自身のオフショア活動を直接規制する枠組みが不十分。|カジノ管理委員会|国会||
|**規制当局の独立性と透明性の欠如**|国家公務員法（非常勤職員の兼業規定の解釈）。IR整備法 第13条（実施協定の公表義務が限定的）。|カジノ管理委員会、大阪府・市|-||

## 第7章 戦略的提言

本分析に基づき、大阪IRの健全性を確保し、犯罪インフラ化を防ぐために、以下の戦略的措置を提言する。

### 7.1 立法・規制機関に対して

1. **データ連携の法的義務化**: IR整備法を改正し、カジノ管理委員会、国家公安委員会（警察庁）、税関、港湾管理者の間で、疑わしい個人や資金の流れに関する情報をリアルタイムで共有する統合データプラットフォームの構築を法的に義務付けるべきである。
    
2. **JCRCの独立性強化**: JCRCの設置根拠法を強化し、出向者を含む全職員の利益相反を厳格に禁止する規定を明記する。また、認可代理店の国境を越えた金融活動に対する調査権限を法定化し、そのための専門人材と予算を確保するべきである。
    
3. **透明性の徹底**: IR整備法を改正し、実施協定や重要な監査報告書など、事業の健全性に関わる主要文書の全文公開を原則として義務付けるべきである。
    

### 7.2 監督・執行機関に対して

1. **JCRCの内部改革**: JCRCは、全ての潜在的な利益相反を排除するため、職員の構成について徹底的な独立したレビューを実施し、結果を公表すべきである。
    
2. **執行の焦点**: 執行機関は、カジノ事業者本体の監視に留まらず、認可されたVIP代理店の金融活動、特に海外との資金の流れの実態解明に捜査・監督リソースを重点的に投入すべきである。
    

### 7.3 調査報道機関および市民監視団体に対して

1. **情報公開請求の活用**: JCRCの議事録、認可代理店に対する背面調査報告書、既存の省庁間情報共有協定（もし存在すれば）などについて、積極的に情報公開請求を行う。
    
2. **企業ネットワークの調査**: 認可が見込まれるVIP代理店の企業構造や役員構成を調査し、オフショアの金融法人や高リスク人物との繋がりを解明する。
    
3. **政治資金の継続的監視**: IR推進に関わる全ての政党および政治家の政治資金の流れ、特に大規模パーティーの収入源とIR関連企業との関係について、継続的な監視と報道を行う。
    

レポートに使用されているソース

[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

特定複合観光施設区域整備法に係る説明会 説明資料

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/horitsusetsumeikai/setumei_siryou.pdf?fbclid=IwAR2KoeYc2Q0m8b0lhDmXJu-MV46YRwTXgGvWvg0lDl66vASjjfPt1Ijp3rE)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

港湾分野における 情報セキュリティ確保に係る安全ガイドライン（第２版） ～導入編～ - 国土交通省

新しいウィンドウで開く](https://www.mlit.go.jp/kowan/content/001880210.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

カジノ管理委員会について

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/ir_kaigi/dai6/siryou3.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

カジノ管理委員会事務局組織令 - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/501CO0000000135)[

![](https://t0.gstatic.com/faviconV2?url=https://note.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

note.com

カジノ規制機関に、カジノコンサルからの出向者【塩川鉄也の国会質問ピックアップ】 - note

新しいウィンドウで開く](https://note.com/jcp_shiokawa/n/na5df00b0f729)[

![](https://t0.gstatic.com/faviconV2?url=https://www.soumu.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

soumu.go.jp

犯罪収益移転防止法等の 概要について

新しいウィンドウで開く](https://www.soumu.go.jp/main_content/000478067.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.gov-online.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

gov-online.go.jp

金融機関などでの取引時に行う「本人確認」等にご協力ください | 政府広報オンライン

新しいウィンドウで開く](https://www.gov-online.go.jp/useful/article/201610/1.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fsa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fsa.go.jp

犯罪収益移転防止法に関する 留意事項について - 金融庁

新しいウィンドウで開く](https://www.fsa.go.jp/common/law/guide/hansyuhou.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www8.cao.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

www8.cao.go.jp

犯罪収益移転防止法(犯収法)の制度概要

新しいウィンドウで開く](https://www8.cao.go.jp/kisei-kaikaku/kaigi/meeting/2013/wg2/sogyo/131105/item2-1.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://www.police.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

police.pref.osaka.lg.jp

特定事業者（この法律で対象となる事業者）の方へ - 大阪府警

新しいウィンドウで開く](https://www.police.pref.osaka.lg.jp/seikatsu/hanzaisyueki/1/index.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

マネー・ローンダリング対策 - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/policy/regulatory/money.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

令和６年４月１日時点 - 警察庁

新しいウィンドウで開く](https://www.npa.go.jp/sosikihanzai/jafic/hourei/data/hougaiyou20240401.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

特定複合観光施設区域整備法に基づく設置運営事業等の監査及び ...

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/503M60000800075)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

特定複合観光施設区域整備法 | e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/430AC0000000080)[

![](https://t1.gstatic.com/faviconV2?url=https://www.customs.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

customs.go.jp

7つの空港で税関検査場電子申告ゲートを利用できます。

新しいウィンドウで開く](https://www.customs.go.jp/kaigairyoko/egate.htm)[

![](https://t3.gstatic.com/faviconV2?url=https://www.macaushimbun.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

macaushimbun.com

マカオ政府がカジノ仲介サンシティグループ創業者らに約1432億円の損害賠償請求

新しいウィンドウで開く](https://www.macaushimbun.com/archives/40081)[

![](https://t3.gstatic.com/faviconV2?url=https://www.ena.travel/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

ena.travel

税関検査とは｜ena(イーナ)の海外旅行用語集

新しいウィンドウで開く](https://www.ena.travel/glossary/customs/)[

![](https://t1.gstatic.com/faviconV2?url=https://arikaina.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

arikaina.com

和歌山のＩＲカジノを突如辞退 サンシティ社のトップ、マカオで逮捕か - Arikaina

新しいウィンドウで開く](https://arikaina.com/_article/202112/alvin-1.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.globalbizgate.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

globalbizgate.com

CIQでひっかかった！ | 貿易よもやま話

新しいウィンドウで開く](https://www.globalbizgate.com/boekitips/2016/05/10/ciq%E3%81%A7%E3%81%B2%E3%81%A3%E3%81%8B%E3%81%8B%E3%81%A3%E3%81%9F/)[

![](https://t1.gstatic.com/faviconV2?url=https://addiction.report/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

addiction.report

「大阪I Rの運営企業は犯罪収益を取り込んでいる疑いがあり不適格」 ギャンブル依存症問題を考える会、国に実施協定の認定取り消しを求めて提訴 | Addiction report

新しいウィンドウで開く](https://addiction.report/NaokoIwanaga/teiso-osakair)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

大阪・夢洲地区特定複合観光施設区域整備 関連協定等について - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/o080020/irs-suishin/kihon-kyoutei/index.html)[

![](https://t1.gstatic.com/faviconV2?url=https://news-hunter.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

news-hunter.org

大阪IR・事業者優遇「協定書」の全文公開 - HUNTER（ハンター）

新しいウィンドウで開く](https://news-hunter.org/?p=11903)[

![](https://t1.gstatic.com/faviconV2?url=https://www.clair.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

clair.or.jp

韓国で唯一韓国人が入場できるカジノ

新しいウィンドウで開く](https://www.clair.or.jp/j/forum/forum/pdf_284/07_kaigai01.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://travel.buyma.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

travel.buyma.com

2025年最新！韓国ソウルのカジノ事情と遊び方ガイド - BUYMA TRAVEL

新しいウィンドウで開く](https://travel.buyma.com/contents/magazine/korea-seoul-casino-hotel/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.uhy-tokyo.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

uhy-tokyo.or.jp

フィリピン：改正マネーロンダリング 防止法の施行規則について - UHY東京監査法人

新しいウィンドウで開く](https://www.uhy-tokyo.or.jp/wp-content/uploads/2017/11/NewsLetter_Audit_01.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.yogonet.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

yogonet.com

マカオ、規制強化でゲーミングジャンケットの認可数を半減、18に - Yogonet

新しいウィンドウで開く](https://www.yogonet.com/ja/%E7%B1%B3%E5%9B%BD%E5%A4%96%E3%81%AE%E4%B8%96%E7%95%8C%E5%90%84%E5%9B%BD/%E3%83%8B%E3%83%A5%E3%83%BC%E3%82%B9-a/2024/01/04/70270-%E3%83%9E%E3%82%AB%E3%82%AA%E3%80%81%E8%A6%8F%E5%88%B6%E5%BC%B7%E5%8C%96%E3%81%A7%E3%82%B2%E3%83%BC%E3%83%9F%E3%83%B3%E3%82%B0%E3%82%B8%E3%83%A3%E3%83%B3%E3%82%B1%E3%83%83%E3%83%88%E3%81%AE%E3%83%A9%E3%82%A4%E3%82%BB%E3%83%B3%E3%82%B9%E6%95%B0%E3%82%9218%E6%AD%B3%E3%81%AB%E5%8D%8A%E6%B8%9B)[

![](https://t3.gstatic.com/faviconV2?url=https://inspire-vip.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

inspire-vip.jp

韓国カジノの年齢制限と入場する際の5つの注意点/おすすめのカジノも

新しいウィンドウで開く](https://inspire-vip.jp/blog/korea-casino-age/)[

![](https://t1.gstatic.com/faviconV2?url=https://asgam.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asgam.jp

8100万ドルハッキング事件をめぐるバングラデシュ中銀による民事訴訟でブルームベリーに呼出状

新しいウィンドウで開く](https://asgam.jp/2020/09/24/bloomberry-receives-summons-in-civil-case-brought-by-bangladesh-bank-over-us81-million-hacking-scandal-jp/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.kuroda-law.gr.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kuroda-law.gr.jp

第74回 資金凍結命令に関する基本事項 - 弁護士法人黒田法律事務所

新しいウィンドウで開く](https://www.kuroda-law.gr.jp/column/philippines-column/5482/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.yogonet.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

yogonet.com

マカオ、賭博改正法案の議論を受け、ジャンケットライセンスをほぼ半減 | Yogonet International

新しいウィンドウで開く](https://www.yogonet.com/ja/international/news/2022/01/26/61127-macau-nearly-halves-junket-licenses-amid-gambling-amendment-bill-discussions)[

![](https://t2.gstatic.com/faviconV2?url=https://cloud.watch.impress.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

cloud.watch.impress.co.jp

【Infostand海外ITトピックス】国際決済ネットワークにハッキング バングラデシュ中銀事件

新しいウィンドウで開く](https://cloud.watch.impress.co.jp/docs/column/infostand/757477.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.nlb.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

nlb.gov.sg

Casino Control Act - Singapore - NLB

新しいウィンドウで開く](https://www.nlb.gov.sg/main/article-detail?cmsuuid=133363ea-f8c3-455e-808a-093be816b12c)[

![](https://t2.gstatic.com/faviconV2?url=https://www.jsanet.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jsanet.or.jp

4・1 改正 SOLAS条約への対応 - 日本船主協会

新しいウィンドウで開く](https://www.jsanet.or.jp/report/nenpo/nenpo2004/text/nenpo2004_04-1.pdf)[

![](https://t2.gstatic.com/faviconV2?url=http://www.jana.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jana.or.jp

ＩＳＰＳコードと 国際航海船舶及び国際港湾 施設の保安の確保等に関す る法律の解説

新しいウィンドウで開く](http://www.jana.or.jp/denko/data/anzenkakuho.pdf)[

![](https://t3.gstatic.com/faviconV2?url=http://imos.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

imos.co.jp

ＩＳＰＳコード国内港湾施設、２日までに92％承認 | 株式会社IMOS

新しいウィンドウで開く](http://imos.co.jp/%EF%BD%89%EF%BD%93%EF%BD%90%EF%BD%93%E3%82%B3%E3%83%BC%E3%83%89%E5%9B%BD%E5%86%85%E6%B8%AF%E6%B9%BE%E6%96%BD%E8%A8%AD%E3%80%81%EF%BC%92%E6%97%A5%E3%81%BE%E3%81%A7%E3%81%AB92%EF%BC%85%E6%89%BF%E8%AA%8D.html)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

国際航海船舶及び国際港湾施設の保安の確保等に関する法律施行規則 - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/416M60000800059)[

![](https://t0.gstatic.com/faviconV2?url=https://www.mti.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mti.gov.sg

13 February 2006 The Casino Control Bill 2006, 2nd Reading Speech by DPM and Minister for Home Affairs, Wong Kan Seng, Parliame - MTI

新しいウィンドウで開く](https://www.mti.gov.sg/-/media/MTI/Legislation/Public-Consultations/2012/Additional-Information-on-the-Integrated-Resorts/minister-wong-kan-seng-2nd-reading-speech-13feb2006.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://asgam.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asgam.com

Regulatory update: Singapore - Inside Asian Gaming

新しいウィンドウで開く](https://asgam.com/2023/06/29/regulatory-update-singapore/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.expo2025.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

expo2025.or.jp

アクセス | EXPO 2025 大阪・関西万博公式Webサイト

新しいウィンドウで開く](https://www.expo2025.or.jp/expo-map-index/access/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.hokkomarina.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

hokkomarina.com

大阪・関西万博開催期間における - 海上保安庁 大阪府警察からのお願い

新しいウィンドウで開く](https://www.hokkomarina.com/pdf/20250321.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.jcp-osaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp-osaka.jp

19年政治資金収支報告書 大阪維新の会政治資金パーティー 一夜で収入１億円超

新しいウィンドウで開く](https://www.jcp-osaka.jp/osaka_now/15947)[

![](https://t3.gstatic.com/faviconV2?url=https://biz.trustdock.io/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

biz.trustdock.io

犯罪収益移転防止法（犯収法）とは？2025年2月発出パブコメなど、最新トレンドや本人確認／eKYC要件等を解説 - TRUSTDOCK

新しいウィンドウで開く](https://biz.trustdock.io/column/amlcft)[

![](https://t1.gstatic.com/faviconV2?url=https://www.travelvoice.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

travelvoice.jp

統合型リゾート（IR）の世界大手「MGM」が日本で体制強化、新社長就任や開発スタッフ常駐など

新しいウィンドウで開く](https://www.travelvoice.jp/20170808-94668)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

いわゆる「ジャンケット」について

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/ir_kaigi/dai7/siryou3.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://oneosaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

oneosaka.jp

報道にある政治資金収支報告書（2023年）の訂正について｜ニュース - 大阪維新の会

新しいウィンドウで開く](https://oneosaka.jp/news/2024/12/26/10215.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.jcp-osaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp-osaka.jp

13年で利益7.6億円政治資金パーティー大阪維新の首長･議員

新しいウィンドウで開く](https://www.jcp-osaka.jp/osaka_now/25829)[

![](https://t0.gstatic.com/faviconV2?url=https://www.orix.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

orix.co.jp

オリックス株式会社 第 61 回定時株主総会 質疑応答要旨

新しいウィンドウで開く](https://www.orix.co.jp/grp/pdf/company/ir/library/shareholder_meeting/61AGMQA.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://asgam.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asgam.jp

MGMリゾーツがビル・ホーンバックル氏をCEO兼社長に任命 - IAG Japan

新しいウィンドウで開く](https://asgam.jp/2020/07/30/mgm-resorts-appoints-bill-hornbuckle-as-ceo-and-president-jp/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.miyake.gr.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

miyake.gr.jp

IR（特定複合観光施設）ニュース】マネー・ローンダリング対策（本人確認等の対象となる特定取引の範囲・現金取引報告（CTR）の対象となる取引の範囲） - 三宅法律事務所

新しいウィンドウで開く](https://www.miyake.gr.jp/notice/ir%EF%BC%88%E7%89%B9%E5%AE%9A%E8%A4%87%E5%90%88%E8%A6%B3%E5%85%89%E6%96%BD%E8%A8%AD%EF%BC%89%E3%83%8B%E3%83%A5%E3%83%BC%E3%82%B9%E3%80%91%E3%83%9E%E3%83%8D%E3%83%BC%E3%83%BB%E3%83%AD%E3%83%BC%E3%83%B3/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.orix.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

orix.co.jp

ORIX Group Code of Conduct - オリックスグループ

新しいウィンドウで開く](https://www.orix.co.jp/grp/pdf/company/about/code_of_conduct/conduct_guideline.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.cas.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

cas.go.jp

特定複合観光施設区域に関する海外事例調査 報告書 - 内閣官房

新しいウィンドウで開く](https://www.cas.go.jp/jp/siryou/pdf/150519houkoku.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://ja.wikipedia.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

ja.wikipedia.org

MGMリゾーツ・インターナショナル - Wikipedia

新しいウィンドウで開く](https://ja.wikipedia.org/wiki/MGM%E3%83%AA%E3%82%BE%E3%83%BC%E3%83%84%E3%83%BB%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8A%E3%82%B7%E3%83%A7%E3%83%8A%E3%83%AB)[

![](https://t3.gstatic.com/faviconV2?url=https://www.1242.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

1242.com

「日本MGMリゾーツ」代表執行役員 兼 社長、ジェイソン・ハイランドさん - ニッポン放送

新しいウィンドウで開く](https://www.1242.com/mikiko/mikiko_blog/20190915-200690/)

参照されたもののレポートには使用されていないソース

[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

免許等による参入規制 - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/content/000002530.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

情報公開 - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/contact/release.html)[

![](https://t1.gstatic.com/faviconV2?url=https://www.shugiin.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

shugiin.go.jp

特定複合観光施設区域整備法案 - 衆議院

新しいウィンドウで開く](https://www.shugiin.go.jp/internet/itdb_gian.nsf/html/gian/honbun/houan/g19609064.htm)[

![](https://t2.gstatic.com/faviconV2?url=https://corporate.ai-con.lawyer/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

corporate.ai-con.lawyer

取締役会における監査役の設置義務と役割・義務を解説 - GVA 法人登記

新しいウィンドウで開く](https://corporate.ai-con.lawyer/articles/company-basic/48)[

![](https://t1.gstatic.com/faviconV2?url=https://okatakashi.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

okatakashi.net

特定複合観光施設区域整備法（IR法）法案の内容はギッシリ？！違法カジノへの対応も必要では。 - 東京都・ 大田区 のDX行政書士

新しいウィンドウで開く](https://okatakashi.net/archives/2803)[

![](https://t1.gstatic.com/faviconV2?url=https://www.obc.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

obc.co.jp

監査役とは？会計監査・業務監査などの役割、設置義務、選任・解任方法を解説 - OBC

新しいウィンドウで開く](https://www.obc.co.jp/special/ipo/column/list/111)[

![](https://t1.gstatic.com/faviconV2?url=https://www.tis.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

tis.co.jp

コーポレートガバナンス | 経営方針 | IR情報 - TIS株式会社

新しいウィンドウで開く](https://www.tis.co.jp/ir/policy/governance/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.dir.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

dir.co.jp

監査等委員会設置会社の現況 2015年07月29日 | 大和総研 | 横山 淳

新しいウィンドウで開く](https://www.dir.co.jp/report/research/law-research/law-others/20150729_009972.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.manegy.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

manegy.com

監査役の設置が義務付けられている「監査役会設置会社」とは？ - Manegy

新しいウィンドウで開く](https://www.manegy.com/news/detail/4447/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.hma-web.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

hma-web.or.jp

夢洲コンテナターミナル前 - 夜間道路通行警備について

新しいウィンドウで開く](https://www.hma-web.or.jp/photo/c13244657273888040c28b245945acd2024ae255.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://mykoho.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mykoho.jp

くらし 大阪・関西万博 開催期間における海上保安庁・大阪府警からのお願い - マイ広報紙

新しいウィンドウで開く](https://mykoho.jp/article/271071/9387782/9457744)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

大阪・夢洲地区特定複合観光施設区域整備等 実施協定書の認可に係る協議について - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/content/000001767.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.researchgate.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

researchgate.net

Casino money laundering regulations – Macao and USA | Request PDF - ResearchGate

新しいウィンドウで開く](https://www.researchgate.net/publication/312260449_Casino_money_laundering_regulations_-_Macao_and_USA)[

![](https://t3.gstatic.com/faviconV2?url=https://www.sanctionscanner.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

sanctionscanner.com

Philippines on FATF's Gray List Again - Sanction Scanner

新しいウィンドウで開く](https://www.sanctionscanner.com/blog/philippines-on-fatf-s-gray-list-again-462)[

![](https://t3.gstatic.com/faviconV2?url=https://sso.agc.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

sso.agc.gov.sg

Casino Control (Junkets) Regulations 2009 - Singapore Statutes Online

新しいウィンドウで開く](https://sso.agc.gov.sg/SL/CCA2006-S663-2009/Historical/20120322?DocDate=20130130&ViewType=Print)[

![](https://t1.gstatic.com/faviconV2?url=https://thediplomat.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

thediplomat.com

Philippines Removed From Watchdog's Money-laundering 'Grey List' - The Diplomat

新しいウィンドウで開く](https://thediplomat.com/2025/02/philippines-removed-from-watchdogs-money-laundering-grey-list/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.proquest.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

proquest.com

Casino money laundering regulations – Macao and USA - ProQuest

新しいウィンドウで開く](https://www.proquest.com/scholarly-journals/casino-money-laundering-regulations-macao-usa/docview/1856576230/se-2)[

![](https://t2.gstatic.com/faviconV2?url=http://www.amlc.gov.ph/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

amlc.gov.ph

A Chronology of the Philippines' Anti-Money Laundering and Counter-Terrorism Financing Technical and Effectiveness Compliance - AMLC

新しいウィンドウで開く](http://www.amlc.gov.ph/images/PDFs/PH%20AMLCTF%20COMPLIANCE%20CHRONOLOGY.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://rccol.archive.royalcommission.vic.gov.au/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

rccol.archive.royalcommission.vic.gov.au

Chapter 02 - Royal Commission into the Casino Operator and Licence

新しいウィンドウで開く](https://rccol.archive.royalcommission.vic.gov.au/volume-1/chapter-02)[

![](https://t2.gstatic.com/faviconV2?url=https://www.iflr.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

iflr.com

Macau criminalises illicit money exchanges - IFLR

新しいウィンドウで開く](https://www.iflr.com/article/2e5xeb1syzoatli2qb85c/sponsored/macau-criminalises-illicit-money-exchanges)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fatf-gafi.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fatf-gafi.org

Mutual Evaluation of the Philippines - FATF

新しいウィンドウで開く](https://www.fatf-gafi.org/content/dam/fatf-gafi/fsrb-fur/APG-Philippines-FUR-2022.pdf.coredownload.inline.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://shuftipro.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

shuftipro.com

Phillippines Added to FATF Gray List Again for Inadequate AML Casino Measures

新しいウィンドウで開く](https://shuftipro.com/news/phillippines-added-to-fatf-gray-list-again-for-inadequate-aml-casino-measures/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.acams.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

acams.org

Macau Junket Operators Pose Financial Crime Risks to Banks - How to Identify - ACAMS

新しいウィンドウで開く](https://www.acams.org/sites/default/files/2020-08/Macau%20Junket%20Operators%20Pose%20Financial%20Crime%20Risks%20to%20Banks%20%E2%80%93%20How%20to%20Identify%2C%20Assess%20and%20Address%20Those%20Risks.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kaiho.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kaiho.mlit.go.jp

二国間での連携・協力 - 海上保安庁

新しいウィンドウで開く](https://www.kaiho.mlit.go.jp/mission/kokusai/nikokukan-renkei.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kaiho.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kaiho.mlit.go.jp

海上保安庁５つの使命 / 国内外機関との連携・協力 / 第七管区海上保安本部

新しいウィンドウで開く](https://www.kaiho.mlit.go.jp/07kanku/fives/05.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.msil.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

msil.go.jp

海洋情報表示システム - 海しる / MSIL

新しいウィンドウで開く](https://www.msil.go.jp/msil/htm/topwindow.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.smtb.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

smtb.jp

特殊詐欺等の被害拡大防止を目的とした 警察庁との「情報連携協定書」締結に関するお知らせ - 三井住友信託銀行

新しいウィンドウで開く](https://www.smtb.jp/-/media/tb/about/corporate/release/pdf/250618.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

海上における捜索救助に関する協定の運用について(通達) - 警察庁

新しいウィンドウで開く](https://www.npa.go.jp/laws/notification/seian/chiiki/kaijyouniokerusousaku.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.port-of-nagoya.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

port-of-nagoya.jp

名古屋港の港湾施設保安対策の取組み

新しいウィンドウで開く](https://www.port-of-nagoya.jp/shokai/hoan/hoantaisaku/1001142.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.soumu.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

soumu.go.jp

各府省等において取り交わされた文書｜海上における捜索救助に関する協定 - 総務省

新しいウィンドウで開く](https://www.soumu.go.jp/menu_hourei/02shoubo01_04000047.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fsa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fsa.go.jp

疑わしい取引の届出制度 - 金融庁

新しいウィンドウで開く](https://www.fsa.go.jp/str/taisaku/index.html)[

![](https://t1.gstatic.com/faviconV2?url=https://www.maff.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

maff.go.jp

犯罪による収益の移転防止に関する法律について - 農林水産省

新しいウィンドウで開く](https://www.maff.go.jp/j/shokusan/syoutori/dealing/money.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fsa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fsa.go.jp

第16 章 疑わしい取引の届出制度 - 金融庁

新しいウィンドウで開く](https://www.fsa.go.jp/common/paper/30/zentai/16.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://inspire-vip.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

inspire-vip.jp

INSPIRE VIP CASINO CLUB | Korea's largest casino tourist facility

新しいウィンドウで開く](https://inspire-vip.jp/en/)[

![](https://t3.gstatic.com/faviconV2?url=https://betrnk-tours.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

betrnk-tours.com

Surprisingly easy | Three ways to become a VIP at a Korean casino! | Betrnk Tours

新しいウィンドウで開く](https://betrnk-tours.com/en/856/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.yogonet.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

yogonet.com

Seoul: Paradise Casino Walkerhill inaugurates VIP venue with new amenities, more gaming machines | Yogonet International

新しいウィンドウで開く](https://www.yogonet.com/international/news/2024/09/19/79255-seoul-paradise-casino-walkerhill-inaugurates-vip-venue-with-new-amenities-more-gaming-machines)[

![](https://t3.gstatic.com/faviconV2?url=https://betrnk-tours.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

betrnk-tours.com

Himeka is an ambassador! Introducing the VIP Program one of the largest inspire casinos in South Korea. | Betrnk Tours

新しいウィンドウで開く](https://betrnk-tours.com/en/3211/)[

![](https://t1.gstatic.com/faviconV2?url=https://practiceguides.chambers.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

practiceguides.chambers.com

Gaming Law 2024 - South Korea | Global Practice Guides - Chambers and Partners

新しいウィンドウで開く](https://practiceguides.chambers.com/practice-guides/gaming-law-2024/south-korea)[

![](https://t0.gstatic.com/faviconV2?url=https://asgam.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asgam.com

Premium on the go – IAG - Inside Asian Gaming

新しいウィンドウで開く](https://asgam.com/2024/02/29/premium-on-the-go/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.lawinsider.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

lawinsider.com

premium player Definition - Law Insider

新しいウィンドウで開く](https://www.lawinsider.com/dictionary/premium-player)[

![](https://t0.gstatic.com/faviconV2?url=https://licensegentlemen.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

licensegentlemen.com

VIP and High-Value Player Support – A Game-Changer for Online Casinos

新しいウィンドウで開く](https://licensegentlemen.com/blog/vip-and-high-value-player-support/)[

![](https://t2.gstatic.com/faviconV2?url=https://joongboomarket.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

joongboomarket.com

Joong Boo Market

新しいウィンドウで開く](https://joongboomarket.com/)[

![](https://t2.gstatic.com/faviconV2?url=https://en.wikipedia.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

en.wikipedia.org

UnionPay - Wikipedia

新しいウィンドウで開く](https://en.wikipedia.org/wiki/UnionPay)[

![](https://t3.gstatic.com/faviconV2?url=https://www.taipeitimes.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

taipeitimes.com

China to halve withdrawals in Macau: report - Taipei Times

新しいウィンドウで開く](https://www.taipeitimes.com/News/biz/archives/2016/12/10/2003660897)[

![](https://t0.gstatic.com/faviconV2?url=https://qz.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

qz.com

Wealthy Chinese are smuggling their riches out of the country with a state-backed bank card - Quartz

新しいウィンドウで開く](https://qz.com/186757/wealthy-chinese-are-smuggling-their-riches-out-of-the-country-with-a-state-backed-bank-card)[

![](https://t0.gstatic.com/faviconV2?url=https://hongkongfp.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

hongkongfp.com

China to halve Macau cash withdrawal limit for UnionPay cardholders | Hong Kong Free Press HKFP

新しいウィンドウで開く](https://hongkongfp.com/2016/12/10/china-to-halve-macau-cash-withdrawal-limit-to-us600-per-atm-visit/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.straitstimes.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

straitstimes.com

Macau halts cash withdrawals at non-compliant ATMs to curb China capital outflow

新しいウィンドウで開く](https://www.straitstimes.com/asia/east-asia/macau-halts-cash-withdrawals-at-non-compliant-atms-to-curb-china-capital-outflow)[

![](https://t1.gstatic.com/faviconV2?url=https://agbrief.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

agbrief.com

Chinese outflows – how do punters move their money? | AGB - Asia Gaming Brief

新しいウィンドウで開く](https://agbrief.com/intel/deep-dive/27/09/2023/under-the-scope-chinese-outflows-how-do-punters-move-their-money/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

平成 29 年度に共同でＩＲ推進局を設置し、夢洲 - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/documents/83191/setumeigenkou.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://agbrief.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

agbrief.com

Macau junkets facing extinction: industry insiders | AGB - Asia Gaming Brief

新しいウィンドウで開く](https://agbrief.com/news/macau/24/01/2024/macau-junkets-facing-extinction/)[

![](https://t0.gstatic.com/faviconV2?url=https://asgam.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asgam.com

Macau's DICJ halves number of licensed junkets to 18 in 2024 - Inside Asian Gaming

新しいウィンドウで開く](https://asgam.com/2024/01/03/macaus-dicj-halves-number-of-licensed-junkets-to-18-in-2024/)[

![](https://t2.gstatic.com/faviconV2?url=https://igamingbusiness.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

igamingbusiness.com

Macau bill to limit junkets passes first Assembly reading - Legal & compliance - iGB

新しいウィンドウで開く](https://igamingbusiness.com/legal-compliance/macau-bill-junkets-limits-passes/)[

![](https://t3.gstatic.com/faviconV2?url=https://www.asianracing.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asianracing.org

Back to the Future - Macau Junkets and Illegal Betting | Asian Racing Federation

新しいウィンドウで開く](https://www.asianracing.org/email/202308qb-back-to-the-future-macau-junkets-and-illegal-betting)[

![](https://t1.gstatic.com/faviconV2?url=https://practiceguides.chambers.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

practiceguides.chambers.com

Gaming Law 2024 - Macau SAR, China | Global Practice Guides - Chambers and Partners

新しいウィンドウで開く](https://practiceguides.chambers.com/practice-guides/gaming-law-2024/macau-sar-china/trends-and-developments)[

![](https://t2.gstatic.com/faviconV2?url=https://www.cgc.org.cy/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

cgc.org.cy

FATF Report highlights major gaps in global response to Proliferation Financing and Sanctions Evasion - Cyprus Gaming and casino supervision commission

新しいウィンドウで開く](https://www.cgc.org.cy/en/fatf-report-highlights-major-gaps-in-global-response-to-proliferation-financing-and-sanctions-evasion/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fatf-gafi.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fatf-gafi.org

Vulnerabilities of Casinos and Gaming Sector - FATF

新しいウィンドウで開く](https://www.fatf-gafi.org/content/dam/fatf-gafi/reports/Vulnerabilities%20of%20Casinos%20and%20Gaming%20Sector.pdf.coredownload.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://sdlccorp.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

sdlccorp.com

How to Get a Gambling License in Singapore? - SDLC Corp

新しいウィンドウで開く](https://sdlccorp.com/post/how-to-get-gambling-license-in-singapore/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.gra.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

gra.gov.sg

Special Employee Licence - GRA - Gambling Regulatory Authority

新しいウィンドウで開く](https://www.gra.gov.sg/licenses-approvals/licences-for-casino-operators-businesses/special-employee-licence)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fatf-gafi.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fatf-gafi.org

FATF Guidance on the Risk-Based Approach for Casinos

新しいウィンドウで開く](https://www.fatf-gafi.org/en/publications/Fatfrecommendations/Fatfguidanceontherisk-basedapproachforcasinos.html)[

![](https://t2.gstatic.com/faviconV2?url=https://anti-money-laundering.eu/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

anti-money-laundering.eu

Online Gambling Services - Anti-Money Laundering

新しいウィンドウで開く](https://anti-money-laundering.eu/online-gambling-services/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.gra.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

gra.gov.sg

Gambling Regulatory Authority

新しいウィンドウで開く](https://www.gra.gov.sg/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.iras.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

iras.gov.sg

Income Tax Treatment for International Market Agents and Representatives - IRAS

新しいウィンドウで開く](https://www.iras.gov.sg/taxes/other-taxes/casino-tax/income-tax-treatment-for-international-market-agents-representatives)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fatf-gafi.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fatf-gafi.org

Vulnerabilities of Casinos and Gaming Sector - FATF

新しいウィンドウで開く](https://www.fatf-gafi.org/en/publications/Methodsandtrends/Vulnerabilitiesofcasinosandgamingsector.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.moneylaundering.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

moneylaundering.com

FATF: Gambling Tourism Highlights Gaps in AML Controls for Casinos - MoneyLaundering.com

新しいウィンドウで開く](https://www.moneylaundering.com/news/fatf-gambling-tourism-highlights-gaps-in-aml-controls-for-casinos/)[

![](https://t3.gstatic.com/faviconV2?url=https://sso.agc.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

sso.agc.gov.sg

Casino Control (Junkets) Regulations 2009 - Singapore Statutes Online

新しいウィンドウで開く](https://sso.agc.gov.sg/SL-Supp/S663-2009/Published?DocDate=20091231&ProvIds=P1II-)[

![](https://t3.gstatic.com/faviconV2?url=https://sso.agc.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

sso.agc.gov.sg

Casino Control (Junkets) Regulations 2009 - Singapore Statutes Online

新しいウィンドウで開く](https://sso.agc.gov.sg/SL-Supp/S663-2009/Published/20091231?DocDate=20091231)[

![](https://t1.gstatic.com/faviconV2?url=https://www.nga.gr.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

nga.gr.jp

日本維新の会 共生社会の実現に向けた十の提言（全国知事会）

新しいウィンドウで開く](https://www.nga.gr.jp/item/material/files/group/2/20171008-24ishin.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://o-ishin.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

o-ishin.jp

政策提言 維新八策 - 日本維新の会

新しいウィンドウで開く](https://o-ishin.jp/about/seisakuteigen/)[

![](https://t3.gstatic.com/faviconV2?url=https://partsa.nikkei.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

partsa.nikkei.com

政策提言 維新八策２０２４ - 日本経済新聞

新しいウィンドウで開く](https://partsa.nikkei.com/parts/ds/shuin2024/pdf/ishin.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://oneosaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

oneosaka.jp

政策｜大阪維新の会

新しいウィンドウで開く](https://oneosaka.jp/policy/policydetail/)[

![](https://t2.gstatic.com/faviconV2?url=https://gendainoriron.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

gendainoriron.jp

「維新は、どこへ向かうのか？」元大阪市立大学特任准教授 水野 博達 ｜ 特集／ - 現代の理論

新しいウィンドウで開く](https://gendainoriron.jp/vol.35/feature/mizuno.php)[

![](https://t0.gstatic.com/faviconV2?url=https://zh.wikipedia.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

zh.wikipedia.org

日本維新會- 維基百科，自由的百科全書

新しいウィンドウで開く](https://zh.wikipedia.org/zh-tw/%E6%97%A5%E6%9C%AC%E7%B6%AD%E6%96%B0%E6%9C%83)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

ＩＲ関連協定等の締結について - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/hodo/fumin/o080020/prs_49080.html)[

![](https://t3.gstatic.com/faviconV2?url=https://o-ishin.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

o-ishin.jp

役員・議員・支部長 - 日本維新の会

新しいウィンドウで開く](https://o-ishin.jp/member/)[

![](https://t2.gstatic.com/faviconV2?url=https://oneosaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

oneosaka.jp

維新の会メンバー - 大阪維新の会

新しいウィンドウで開く](https://oneosaka.jp/member/)[

![](https://t2.gstatic.com/faviconV2?url=https://oneosaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

oneosaka.jp

役員｜維新の会メンバー - 大阪維新の会

新しいウィンドウで開く](https://oneosaka.jp/member/executive/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.ishin-nara.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

ishin-nara.jp

メンバー紹介 - 日本維新の会奈良県総支部

新しいウィンドウで開く](https://www.ishin-nara.jp/member)[

![](https://t1.gstatic.com/faviconV2?url=https://www.shugiin.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

shugiin.go.jp

会派別議員一覧（日本維新の会） - 衆議院

新しいウィンドウで開く](https://www.shugiin.go.jp/internet/itdb_annai.nsf/html/statics/syu/030kaiha.htm)[

![](https://t1.gstatic.com/faviconV2?url=https://ishin.hyogo.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

ishin.hyogo.jp

About | 兵庫維新の会

新しいウィンドウで開く](https://ishin.hyogo.jp/about)[

![](https://t3.gstatic.com/faviconV2?url=https://www2.deloitte.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

www2.deloitte.com

IR事業（カジノ事業）における特徴的なリスクとリスクマネジメント - Deloitte

新しいウィンドウで開く](https://www2.deloitte.com/jp/ja/pages/real-estate/articles/re/ir-business-riskmanagement.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.sangiin.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

sangiin.go.jp

カジノを含む統合型リゾートの実現に向けた取組 - 参議院

新しいウィンドウで開く](https://www.sangiin.go.jp/japanese/annai/chousa/rippou_chousa/backnumber/2017pdf/20171201048.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

ＩＲ区域整備計画 審査の概要 国土交通省観光庁

新しいウィンドウで開く](https://www.mlit.go.jp/kankocho/content/810000786.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.jcp-osaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp-osaka.jp

日本のどこにもカジノはいらない維新・安倍政権 大阪カジノへまっしぐら市民多数が反対 声上げよう - 日本共産党大阪府委員会

新しいウィンドウで開く](https://www.jcp-osaka.jp/osaka_now/9031)[

![](https://t3.gstatic.com/faviconV2?url=https://diamond.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

diamond.jp

維新と大阪財界は「相互不信」、カジノ計画にあの巨大企業グループが距離を置く理由

新しいウィンドウで開く](https://diamond.jp/articles/-/308250)[

![](https://t3.gstatic.com/faviconV2?url=https://www.ktv.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

ktv.jp

「万博」のギモン 安藤優子・田村淳が吉村知事を直撃 赤字になったら？間に合う？誰の意向で夢洲？ | 特集 - カンテレ

新しいウィンドウで開く](https://www.ktv.jp/news/feature/231226-yoshimura-ando-tamura/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.kankokeizai.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kankokeizai.com

国交相、大阪IR認定に条件 安定運営へ非カジノ事業に投資を - 観光経済新聞

新しいウィンドウで開く](https://www.kankokeizai.com/%E5%9B%BD%E4%BA%A4%E7%9B%B8%E3%80%81%E5%A4%A7%E9%98%AAir%E8%AA%8D%E5%AE%9A%E3%81%AB%E6%9D%A1%E4%BB%B6%E3%80%80%E5%AE%89%E5%AE%9A%E9%81%8B%E5%96%B6%E3%81%B8%E9%9D%9E%E3%82%AB%E3%82%B8%E3%83%8E%E4%BA%8B/)[

![](https://t3.gstatic.com/faviconV2?url=https://diamond.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

diamond.jp

関西財界の憂鬱、コロナで浮上した「万博・IR実現危機」と負担の行方 - ダイヤモンド・オンライン

新しいウィンドウで開く](https://diamond.jp/articles/-/247133)[

![](https://t2.gstatic.com/faviconV2?url=https://www.jcp.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp.or.jp

破綻する関西万博（４）/経済効果 幻想生む過大な計画 - 日本共産党

新しいウィンドウで開く](https://www.jcp.or.jp/akahata/aik24/2025-03-31/2025033103_01_0.html)[

![](https://t0.gstatic.com/faviconV2?url=https://toyokeizai.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

toyokeizai.net

吉村洋文が語る≪大阪・関西万博≫「うれしい悲鳴」と「ポスト万博」戦略 - 東洋経済オンライン

新しいウィンドウで開く](https://toyokeizai.net/articles/-/887186?display=b)[

![](https://t2.gstatic.com/faviconV2?url=https://oneosaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

oneosaka.jp

2029年 - 大阪のIR計画は、人工島 「夢洲( ゆめしま)」の敷地49万平方メート ルに国際会議場や展示場、関西の魅 力を発信する施設などを整備し

新しいウィンドウで開く](https://oneosaka.jp/mirai_nenpyo/2029_1.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://betrnk-tours.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

betrnk-tours.com

カジノのジャンケットとは？仕事内容や利用するメリットを紹介 - ベットランクツアーズ

新しいウィンドウで開く](https://betrnk-tours.com/1694)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

大阪府夢洲警察署（仮称）新築工事基本設計業務 公募型プロポーザルの概要 公共建築室 計画

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/documents/101559/07_gaiyou_yumesimak.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://asgam.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asgam.jp

国内ジャンケット事業者 前社長が1.5億以上使い込みか 現経営陣は刑事告発も検討 - IAG Japan

新しいウィンドウで開く](https://asgam.jp/2021/02/04/japanese-junket-considers-legal-action-against-former-president-for-gambling-away-us1-4-million-in-macau-jp/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

大阪・夢洲地区特定複合観光施設区域の整備に関する計画 令和５年度（2023 年度）実施状況評 - 国土交通省

新しいウィンドウで開く](https://www.mlit.go.jp/kankocho/content/001762448.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://debatekk.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

debatekk.net

【事例】日本でカジノを解禁すべきか - ディベート教育

新しいウィンドウで開く](https://debatekk.net/hitori_top/case_casino/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

大阪・夢洲地区特定複合観光施設区域の整備に関する計画 令和５年度（2023 年度）実施状況評 - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/documents/63792/04r6_2_shiryou3.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.daily.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

daily.co.jp

吉村大阪府知事、ＩＲ疑問に「ギャンブル依存症はすでにある国」対策徹底で「減らせる」入場制限も

新しいウィンドウで開く](https://www.daily.co.jp/gossip/2023/05/06/0016320979.shtml)[

![](https://t2.gstatic.com/faviconV2?url=https://www.city.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

city.osaka.lg.jp

報道発表資料 大阪IR工事暴力団等排除協議会の設立について - 大阪市

新しいウィンドウで開く](https://www.city.osaka.lg.jp/hodoshiryo/irsuishin/0000639187.html)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

大阪IR工事暴力団等排除協議会について - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/o080020/irs-suishin/bouhaikyougikai.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

ＩＲ・カジノ制度の在り方と 刑法の賭博に関する法制との整合性の検討について

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/ir_kaigi/dai8/siryou2_3.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.kochi-tech.ac.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kochi-tech.ac.jp

日本におけるギャンブルと IR に関する研究 - 高知工科大学

新しいウィンドウで開く](https://www.kochi-tech.ac.jp/library/ron/pdf/2020/03/15/a1210412.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://hermes-ir.lib.hit-u.ac.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

hermes-ir.lib.hit-u.ac.jp

金融破綻処理の手続法的考察 - HERMES-IR

新しいウィンドウで開く](https://hermes-ir.lib.hit-u.ac.jp/hermes/ir/re/19080/0201100301.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kansai-airport.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kansai-airport.or.jp

お問い合わせ - 関西国際空港

新しいウィンドウで開く](https://www.kansai-airport.or.jp/contact)[

![](https://t2.gstatic.com/faviconV2?url=https://www.digima-japan.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

digima-japan.com

IRの候補地は？ カジノとの違いは？ | 日本におけるIRの重要性と目指すべきビジョン

新しいウィンドウで開く](https://www.digima-japan.com/knowhow/world/15542.php)[

![](https://t1.gstatic.com/faviconV2?url=https://www.customs.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

customs.go.jp

各税関の摘発事件発表（令和6年）

新しいウィンドウで開く](https://www.customs.go.jp/kyotsu/hodo/jikenhodo/2024jiken/jiken2024.htm)[

![](https://t2.gstatic.com/faviconV2?url=https://funeco.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

funeco.jp

大阪港テロ対策合同訓練、12/12に天保山岸壁で実施へ 海保による不審船の海上制圧も | フネコ

新しいウィンドウで開く](https://funeco.jp/news/news-22544/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

犯罪収益移転防止に 関する年次報告書 （令和５年） - 警察庁

新しいウィンドウで開く](https://www.npa.go.jp/sosikihanzai/jafic/nenzihokoku/data/jafic_2023.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

年次報告書｜JAFIC 警察庁

新しいウィンドウで開く](https://www.npa.go.jp/sosikihanzai/jafic/nenzihokoku/nenzihokoku.htm)[

![](https://t0.gstatic.com/faviconV2?url=https://www.youtube.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

youtube.com

逃走するテロリストを制圧！大阪・関西万博見据え、高知新港で《テロ対策訓練》【高知】 (24/09/26 18:55) - YouTube

新しいウィンドウで開く](https://www.youtube.com/watch?v=AvcafzHrchE)[

![](https://t1.gstatic.com/faviconV2?url=https://www.kaijipress.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kaijipress.com

大阪港湾局など、堺泉北・阪南港でテロ訓練 | 海運＜コンテナ・物流＞ | ニュース - 海事プレス

新しいウィンドウで開く](https://www.kaijipress.com/news/container/2023/12/180790/bit.ly/4jLtyxx)[

![](https://t0.gstatic.com/faviconV2?url=https://www.asahi.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asahi.co.jp

万博会場でテロ対策訓練 博覧会協会と大阪府警など合同実施 対応手順を確認

新しいウィンドウで開く](https://www.asahi.co.jp/webnews/pages/abc_30379.html)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

堺泉北港における令和6年度テロ対策総合訓練の実施について - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/hodo/fumin/o150010010/prs_51101.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.city.kaizuka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

city.kaizuka.lg.jp

貝塚市 阪南港でテロ対策総合訓練

新しいウィンドウで開く](https://www.city.kaizuka.lg.jp/material/files/group/80/20191125hodo_terokunren.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://cir.nii.ac.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

cir.nii.ac.jp

日本の立法過程の特色--比較法的視点から - CiNii Research

新しいウィンドウで開く](https://cir.nii.ac.jp/crid/1521980704781421568)[

![](https://t2.gstatic.com/faviconV2?url=https://ir.library.osaka-u.ac.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

ir.library.osaka-u.ac.jp

The University of Osaka Institutional Knowledge Archive : OUKA

新しいウィンドウで開く](https://ir.library.osaka-u.ac.jp/repo/ouka/all/61759/29141_%E8%AB%96%E6%96%87.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://core.ac.uk/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

core.ac.uk

犯罪被害者支援の歴史社会学に向けて : 先行研究 と分析視角 ... - CORE

新しいウィンドウで開く](https://core.ac.uk/download/pdf/56658793.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kitakyu-u.ac.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kitakyu-u.ac.jp

<昼> - 北九州市立大学

新しいウィンドウで開く](https://www.kitakyu-u.ac.jp/campus/courses/syllabus/2010/5243fd9798b677652df6a3f9a3747f3b.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://cir.nii.ac.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

cir.nii.ac.jp

IR整備法における反社会的勢力排除 - CiNii Research

新しいウィンドウで開く](https://cir.nii.ac.jp/crid/1522262179678633600)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

組織犯罪対策｜警察庁Webサイト

新しいウィンドウで開く](https://www.npa.go.jp/bureau/sosikihanzai/kikakubunseki.html)[

![](https://t0.gstatic.com/faviconV2?url=https://cir.nii.ac.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

cir.nii.ac.jp

フランスにおける立法過程 : 修正権に着目して - CiNii Research

新しいウィンドウで開く](https://cir.nii.ac.jp/crid/1050282677674717440)[

![](https://t3.gstatic.com/faviconV2?url=https://o-ishin.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

o-ishin.jp

Individual Donations 個人寄附について - 日本維新の会

新しいウィンドウで開く](https://o-ishin.jp/about/donation/)[

![](https://t2.gstatic.com/faviconV2?url=https://seijishikin-ombudsman.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

seijishikin-ombudsman.com

分派「おおさか維新の会」議員グループの政党交付金の脱法的残金国庫返還逃れ（２０１５年１２月～２０１６年３月）と「身を肥やして誕生した政党」 - 政治資金オンブズマン

新しいウィンドウで開く](https://seijishikin-ombudsman.com/topics/7893.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.jcp-osaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp-osaka.jp

府市から104億円受注･契約維新の会のパー券購入企業企業･団体献金の禁止こそ

新しいウィンドウで開く](https://www.jcp-osaka.jp/osaka_now/26514)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.aichi.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.aichi.jp

組織犯罪対策 - 愛知県警察

新しいウィンドウで開く](https://www.pref.aichi.jp/police/anzen/soshiki/kouhou/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

組織犯罪対策部｜警察庁Webサイト

新しいウィンドウで開く](https://www.npa.go.jp/bureau/sosikihanzai/index.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

関係法令一覧

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/kankeihourei/index.html)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

特定複合観光施設区域整備法施行令 - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/431CO0000000072)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

IR整備法の施行に伴うカジノ管理委員会関係特定複合観光施設区域整備法施行規則等の制定について - 報道発表等 - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/report/press/press0716.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

「特定複合観光施設区域整備法施行令（案）」に対する意見募集について

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/seireiikenbosyu/ikenbosyu.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.japaneselawtranslation.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

japaneselawtranslation.go.jp

特定複合観光施設区域整備法施行令 - 日本語／英語 - Japanese Law Translation

新しいウィンドウで開く](https://www.japaneselawtranslation.go.jp/ja/laws/view/4749)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

夢洲カジノを止める大阪府民の会 要望書

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/o070050/koho/06-dantaial/070204_yobo.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.jcp.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp.or.jp

主張/大阪カジノ土地対策/約束違反の公金投入許されぬ - 日本共産党

新しいウィンドウで開く](https://www.jcp.or.jp/akahata/aik21/2021-12-29/2021122902_01_0.html)[

![](https://t0.gstatic.com/faviconV2?url=https://note.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

note.com

カジノは必要？住民投票は？大阪府知事選討論会 ABC『newsおかえり』文字おこし（3月9日放送）

新しいウィンドウで開く](https://note.com/nokosoosaka/n/n1cd689dfc8cb)[

![](https://t3.gstatic.com/faviconV2?url=https://www.pref.hiroshima.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.hiroshima.lg.jp

港湾施設のテロ対策について - 広島県

新しいウィンドウで開く](https://www.pref.hiroshima.lg.jp/site/hiroshimakennkouwann/1171008493527.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mof.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mof.go.jp

国内のマネロン・テロ資金供与・拡散金融対策 - 財務省

新しいウィンドウで開く](https://www.mof.go.jp/policy/international_policy/amlcftcpf/3.efforts.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.jcp.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp.or.jp

ＩＲカジノ準備工事着手へ/大阪 事業者が解除権を放棄 - 日本共産党

新しいウィンドウで開く](https://www.jcp.or.jp/akahata/aik24/2024-09-11/2024091104_01_0.html)[

![](https://t2.gstatic.com/faviconV2?url=https://no-casino.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

no-casino.net

大阪のカジノ（賭博場）誘致計画の「認定」取り消しを求めるWeb署名

新しいウィンドウで開く](https://no-casino.net/archives/314)[

![](https://t1.gstatic.com/faviconV2?url=https://www.jlaf.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jlaf.jp

２０２３年１０月２３日、大阪ＩＲ（カジノを含む統合型リゾート）の実施に断固反対する決議 - 自由法曹団

新しいウィンドウで開く](https://www.jlaf.jp/04ketsugi/2023/1026_1644.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.chosyu-journal.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

chosyu-journal.jp

泥船化する大阪万博・カジノ構想 海外からもそっぽ向かれ 国に泣きつく大阪維新 膨らむのは公的負担のみ | 長周新聞

新しいウィンドウで開く](https://www.chosyu-journal.jp/shakai/27615)[

![](https://t2.gstatic.com/faviconV2?url=https://chikyuza.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

chikyuza.net

ＩＲ(カジノ)とは「共食い」である。松井一郎よ、吉村洋文よ、立ち止まれ。そして「引き返す勇気」を持て。 - ちきゅう座

新しいウィンドウで開く](https://chikyuza.net/%EF%BD%89%EF%BD%92%E3%82%AB%E3%82%B8%E3%83%8E%E3%81%A8%E3%81%AF%E3%80%8C%E5%85%B1%E9%A3%9F%E3%81%84%E3%80%8D%E3%81%A7%E3%81%82%E3%82%8B%E3%80%82%E6%9D%BE%E4%BA%95%E4%B8%80%E9%83%8E%E3%82%88%E3%80%81/)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

国際航海船舶及び国際港湾施設の保安の確保等に関する法律 - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/416AC0000000031)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

特定複合観光施設区域整備法の概要① - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/content/000001099.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

国際船舶・港湾保安法に基づく埠頭保安規程等の承認について - 国土交通省

新しいウィンドウで開く](https://www.mlit.go.jp/kowan/kowan_tk1_000041.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

国際航海船舶及び国際港湾施設の保安の確保等に関する法律とは？ - 国土交通省

新しいウィンドウで開く](https://www.mlit.go.jp/seisakutokatsu/solas/index2.html)[

![](https://t1.gstatic.com/faviconV2?url=https://www.shugiin.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

shugiin.go.jp

国際航海船舶及び国際港湾施設の保安の確保等に関する法律 - 衆議院

新しいウィンドウで開く](https://www.shugiin.go.jp/internet/itdb_housei.nsf/html/housei/15920040414031.htm)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fsa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fsa.go.jp

マネロン・テロ資金供与対策ガイドラインに関するよくあるご質問 （ＦＡＱ） - 金融庁

新しいウィンドウで開く](https://www.fsa.go.jp/news/r4/202208_amlcft_faq/202208_amlcft_faq.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

犯罪収益移転危険度調査書 - 警察庁

新しいウィンドウで開く](https://www.npa.go.jp/sosikihanzai/jafic/nenzihokoku/risk/risk021105.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://cpa.mynavi.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

cpa.mynavi.jp

監査とはなにか？基礎知識や目的について解説 - マイナビ会計士

新しいウィンドウで開く](https://cpa.mynavi.jp/column_mt/2021/11/830.html)[

![](https://t1.gstatic.com/faviconV2?url=https://thefinance.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

thefinance.jp

カジノ法案(IR整備法)成立！カジノ事業の規制を弁護士が解説 - The Finance

新しいウィンドウで開く](https://thefinance.jp/law/180905)[

![](https://t1.gstatic.com/faviconV2?url=https://www.7andi.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

7andi.com

企業統治の「仕組み」の概要等 | 株主・投資家情報(IR) | セブン＆アイ・ホールディングス

新しいウィンドウで開く](https://www.7andi.com/ir/management/governance/structure.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

犯罪収益移転防止に関する 年 次 報 告 書 （令和３年） 概要版 - 警察庁

新しいウィンドウで開く](https://www.npa.go.jp/sosikihanzai/jafic/nenzihokoku/data/nennzi_gaiyou2021.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

令和６年12月２日時点 - 警察庁

新しいウィンドウで開く](https://www.npa.go.jp/sosikihanzai/jafic/hourei/data/hougaiyou20241202.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.hitachi.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

hitachi.co.jp

コーポレートガバナンス体制：株主・投資家向け情報：日立

新しいウィンドウで開く](https://www.hitachi.co.jp/IR/corporate/governance/system/index.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.corporate-legal.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

corporate-legal.jp

ニュース「IRジャパンが委員を増員へ、監査等委員会設置会社について」 - 企業法務ナビ

新しいウィンドウで開く](https://www.corporate-legal.jp/news/5314)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fsa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fsa.go.jp

金融機関におけるマネロン・テロ資金供与・拡散金融対策について ...

新しいウィンドウで開く](https://www.fsa.go.jp/policy/amlcftcpt/index.html)[

![](https://t2.gstatic.com/faviconV2?url=https://biz.moneyforward.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

biz.moneyforward.com

外部監査とは？IPOで実施することや流れ・スムーズに行うポイントを解説

新しいウィンドウで開く](https://biz.moneyforward.com/ipo/basic/5109/)[

![](https://t3.gstatic.com/faviconV2?url=https://www.clo.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

clo.jp

ＩＲ整備法とそのプレーヤーに関する概説 - 弁護士法人中央総合法律事務所

新しいウィンドウで開く](https://www.clo.jp/wp-content/uploads/2019/12/news95_Part7.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

犯罪収益移転防止法の概要について - 国土交通省

新しいウィンドウで開く](https://www.mlit.go.jp/common/001147570.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

カジノ施設・機器の規制及びカジノ事業活動の規制について

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/ir_kaigi/dai4/siryou3.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://lawzilla.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

lawzilla.jp

カジノ管理委員会関係特定複合観光施設区域整備法施行規則 第49条

新しいウィンドウで開く](https://lawzilla.jp/law/503M62000000001?n=ln49&mode=only)[

![](https://t1.gstatic.com/faviconV2?url=https://www.meti.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

meti.go.jp

犯罪収益移転防止法関係 - 経済産業省

新しいウィンドウで開く](https://www.meti.go.jp/policy/economy/consumer/credit/anti_money_laundering.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

犯罪収益移転防止法の概要 - 建設産業・不動産業 - 国土交通省

新しいウィンドウで開く](https://www.mlit.go.jp/totikensangyo/const/sosei_const_tk3_000069.html)[

![](https://t2.gstatic.com/faviconV2?url=https://hourei.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

hourei.net

犯罪による収益の移転防止に関する法律｜条文 - 法令リード

新しいウィンドウで開く](https://hourei.net/law/419AC0000000022)[

![](https://t2.gstatic.com/faviconV2?url=https://hourei.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

hourei.net

特定複合観光施設区域の整備の推進に関する法律 - 法令リード

新しいウィンドウで開く](https://hourei.net/law/428AC1000000115)[

![](https://t1.gstatic.com/faviconV2?url=https://www.shugiin.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

shugiin.go.jp

犯罪による収益の移転防止に関する法律 - 衆議院

新しいウィンドウで開く](https://www.shugiin.go.jp/internet/itdb_housei.nsf/html/housei/16620070331022.htm)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

特定複合観光施設区域の整備の推進に関する法律 - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/428AC1000000115)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

関係法令等一覧 - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/policy/legal/index.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.japaneselawtranslation.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

japaneselawtranslation.go.jp

特定複合観光施設区域の整備の推進に関する法律 - 日本語／英語 - Japanese Law Translation

新しいウィンドウで開く](https://www.japaneselawtranslation.go.jp/ja/laws/view/3025)[

![](https://t1.gstatic.com/faviconV2?url=https://www.shugiin.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

shugiin.go.jp

特定複合観光施設区域の整備の推進に関する法律案 - 衆議院

新しいウィンドウで開く](https://www.shugiin.go.jp/internet/itdb_gian.nsf/html/gian/honbun/houan/g18305029.htm)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

た ち が 創 る ︒ 来 が ひ ら く - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/content/000001905.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

大阪・ 夢洲地区特定複合観光施設区域

新しいウィンドウで開く](https://www.mlit.go.jp/kankocho/content/810002602.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

保安に関するお知らせ｜警察庁Webサイト

新しいウィンドウで開く](https://www.npa.go.jp/bureau/safetylife/hoan/index.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kaiho.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kaiho.mlit.go.jp

万博開催期間中における皆様へのご協力のお願い - 海上保安庁

新しいウィンドウで開く](https://www.kaiho.mlit.go.jp/05kanku/contents/news/archives/cat47/honbu/2025-02-25-1120-post-3350.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.classnk.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

classnk.or.jp

船舶保安システム(ISPS) - ClassNK

新しいウィンドウで開く](https://www.classnk.or.jp/hp/ja/activities/statutory/isps/index.html)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

よくある質問 - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/o080010/irs-kikaku/irfaq/index.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.pa.kkr.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pa.kkr.mlit.go.jp

みなと用語辞典 - 近畿地方整備局港湾空港部 - 国土交通省

新しいウィンドウで開く](https://www.pa.kkr.mlit.go.jp/general/fast/glossary/index.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jll.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jll.com

大阪のIR区域整備計画が認定～期待が高まる大阪マーケット - JLL

新しいウィンドウで開く](https://www.jll.com/ja-jp/insights/ir-approval-growth-expected-osaka-market)[

![](https://t2.gstatic.com/faviconV2?url=https://www.eventbiz.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

eventbiz.net

【大阪IR】建設工事に着工 2030年秋ごろ開業 カジノ含む統合型リゾート - 展示会とMICE

新しいウィンドウで開く](https://www.eventbiz.net/?p=155605)[

![](https://t2.gstatic.com/faviconV2?url=https://mgmosaka.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mgmosaka.co.jp

大阪・夢洲地区特定複合観光施設区域の整備に関する計画 令和５年度（2023 年度）実施状況報 - ＭＧＭ大阪

新しいウィンドウで開く](https://mgmosaka.co.jp/wp-content/uploads/2024/08/%E5%AE%9F%E6%96%BD%E7%8A%B6%E6%B3%81%E5%A0%B1%E5%91%8A%E6%9B%B8_2024%E5%B9%B43%E6%9C%88%E6%9C%9F.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

大阪府市/IR事業者からの回答

新しいウィンドウで開く](https://www.mlit.go.jp/kankocho/content/001760919.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.homes.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

homes.co.jp

大阪IR（統合型リゾート）はいつ開業する？ 計画の概要と今後の課題 - ホームズ

新しいウィンドウで開く](https://www.homes.co.jp/cont/press/buy/buy_01577/)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

特定複合観光施設区域整備法に基づくカジノ事業者 ... - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/504M62000800001)[

![](https://t3.gstatic.com/faviconV2?url=https://jicpa.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jicpa.or.jp

「業種別委員会実務指針第70号「特定複合観光施設区域整備法に ...

新しいウィンドウで開く](https://jicpa.or.jp/specialized_field/20240329wqr.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

カジノ事業活動の規制 - カジノ管理委員会

新しいウィンドウで開く](https://www.jcrc.go.jp/policy/regulatory/casino.html)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

経済連携協定に基づく特定原産地証明書の発給等に関する法律 - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/416AC0000000143)[

![](https://t3.gstatic.com/faviconV2?url=http://www.jcp-yokohama.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp-yokohama.com

韓国カジノ視察 報告書 - 日本共産党 横浜市会議員団

新しいウィンドウで開く](http://www.jcp-yokohama.com/wp-content/uploads/2019/11/201910.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.rieti.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

rieti.go.jp

no.14: 行政機関による情報共有の不安と国家安全保障 - 経済産業研究所

新しいウィンドウで開く](https://www.rieti.go.jp/users/it/column/column030528.html)[

![](https://t1.gstatic.com/faviconV2?url=https://www.city.gotsu.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

city.gotsu.lg.jp

江津市地域防災計画 - 江津市ホームページ

新しいウィンドウで開く](https://www.city.gotsu.lg.jp/uploaded/attachment/18498.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

港湾分野における情報セキュリティ確保に係る 安全ガイドライン(第2版)

新しいウィンドウで開く](https://www.mlit.go.jp/kowan/content/001879951.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.rilg.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

rilg.or.jp

捜査関係事項照会書に基づく警察への資料提供について - 地方自治研究機構

新しいウィンドウで開く](https://www.rilg.or.jp/htdocs/main/houmu_qa/2021/67_winter01.html)[

![](https://t1.gstatic.com/faviconV2?url=https://asgam.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asgam.jp

バングラデシュ銀行の強盗事件はまだ未解決：法務省 - IAG Japan

新しいウィンドウで開く](https://asgam.jp/2019/01/15/bangladesh-bank-heist-case-not-yet-closed-department-of-justice-jp/)[

![](https://t0.gstatic.com/faviconV2?url=https://toyokeizai.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

toyokeizai.net

バングラ中銀｢史上最大の銀行強盗｣の内幕 ハッカーが約8000万ドルを盗み出した

新しいウィンドウで開く](https://toyokeizai.net/articles/-/109458?display=b)[

![](https://t3.gstatic.com/faviconV2?url=https://www.city.kyoto.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

city.kyoto.lg.jp

個 人 情 報 保 護 事 務 の 手 引 - 京都市

新しいウィンドウで開く](https://www.city.kyoto.lg.jp/sogo/cmsfiles/contents/0000084/84692/kojinjyohotebiki2804.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.wam.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

wam.go.jp

第５回：守秘義務について考える - WAM NET

新しいウィンドウで開く](https://www.wam.go.jp/content/wamnet/pcpub/top/fukushiiryokeiei/iryokaigonoriskmanage/iryokaigonoriskmanage005.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.straitstimes.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

straitstimes.com

Marina Bay Sands casino under probe in S'pore and US: Report | The Straits Times

新しいウィンドウで開く](https://www.straitstimes.com/business/companies-markets/marina-bay-sands-casino-in-singapore-under-probe-over-money-laundering)[

![](https://t1.gstatic.com/faviconV2?url=https://fukuzaki-law.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fukuzaki-law.jp

No.25／ 警察・検察等の捜査機関からの患者情報の照会への対応について

新しいウィンドウで開く](https://fukuzaki-law.jp/iryouhoumu/25/)[

![](https://t2.gstatic.com/faviconV2?url=https://www.todayonline.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

todayonline.com

Marina Bay Sands casino faces US money laundering probe: Bloomberg - TODAYonline

新しいウィンドウで開く](https://www.todayonline.com/singapore/singapores-marina-bay-sands-casino-faces-us-money-laundering-probe-bloomberg)[

![](https://t0.gstatic.com/faviconV2?url=https://www.soumu.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

soumu.go.jp

捜査機関による第三者保有の個人情報に対するアクセス と本人の保護 - 総務省

新しいウィンドウで開く](https://www.soumu.go.jp/main_content/000719095.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://mgmosaka.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mgmosaka.co.jp

Site Policy - MGM Osaka Corporation

新しいウィンドウで開く](https://mgmosaka.co.jp/en/sitepolicy_en/)[

![](https://t3.gstatic.com/faviconV2?url=https://www.nationthailand.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

nationthailand.com

MGM Osaka to redefine Japan's tourism and entertainment - Nation Thailand

新しいウィンドウで開く](https://www.nationthailand.com/blogs/news/world/40049512)[

![](https://t0.gstatic.com/faviconV2?url=https://financialcrimeacademy.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

financialcrimeacademy.org

Money Laundering Through Casinos In Macau - Financial Crime Academy

新しいウィンドウで開く](https://financialcrimeacademy.org/money-laundering-through-casinos-in-macau/)[

![](https://t1.gstatic.com/faviconV2?url=https://casinobeats.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

casinobeats.com

MGM and Orix Begin Construction on $8.9 Billion Osaka Resort - CasinoBeats

新しいウィンドウで開く](https://casinobeats.com/2025/04/28/mgm-and-orix-begin-construction-on-8-9-billion-osaka-resort/)[

![](https://t0.gstatic.com/faviconV2?url=https://sigma.world/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

sigma.world

Potential delays loom over MGM's Osaka Integrated Resort - SiGMA World

新しいウィンドウで開く](https://sigma.world/news/mgm-osaka-push-back-2030-opening-target/)[

![](https://t3.gstatic.com/faviconV2?url=https://uk.investing.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

uk.investing.com

Macau investigates former top prosecutor over corruption scandal - Investing.com UK

新しいウィンドウで開く](https://uk.investing.com/news/world-news/macau-investigates-former-top-prosecutor-over-corruption-scandal-90630)[

![](https://t2.gstatic.com/faviconV2?url=https://investors.mgmresorts.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

investors.mgmresorts.com

MGM RESORTS INTERNATIONAL ANNOUNCES OFFICIAL CERTIFICATION OF ITS AREA DEVELOPMENT PLAN IN OSAKA

新しいウィンドウで開く](https://investors.mgmresorts.com/investors/news-releases/press-release-details/2023/MGM-RESORTS-INTERNATIONAL-ANNOUNCES-OFFICIAL-CERTIFICATION-OF-ITS-AREA-DEVELOPMENT-PLAN-IN-OSAKA/default.aspx)[

![](https://t0.gstatic.com/faviconV2?url=https://www.gamblinginsider.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

gamblinginsider.com

Osaka IR plans for opening in 2030 - Gambling Insider

新しいウィンドウで開く](https://www.gamblinginsider.com/news/26716/osaka-ir-plans-for-opening-in-2030)[

![](https://t0.gstatic.com/faviconV2?url=https://www.thomsonreuters.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

thomsonreuters.com

Casino AML risks & reforms under spotlight in global gambling hubs - Thomson Reuters

新しいウィンドウで開く](https://www.thomsonreuters.com/en-us/posts/investigation-fraud-and-risk/casino-aml-risks/)[

![](https://t2.gstatic.com/faviconV2?url=https://igamingbusiness.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

igamingbusiness.com

Macau announces plan to criminalise illegal money exchanges - iGaming Business

新しいウィンドウで開く](https://igamingbusiness.com/casino/illegal-money-exchanges-ban-macau/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.youtube.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

youtube.com

BVTV: Macau's missing gamblers | REUTERS - YouTube

新しいウィンドウで開く](https://www.youtube.com/watch?v=JdgY5jh7GHA)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fsa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fsa.go.jp

マネー・ローンダリング及びテロ資金供与対策 に関する ... - 金融庁

新しいウィンドウで開く](https://www.fsa.go.jp/common/law/amlcft/211122_amlcft_guidelines.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.youtube.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

youtube.com

政治家の“お金の出入り”を可視化 民間人がデータベースを開発 夜のお店に支出も… 現在の収支報告書は検索できず…国はなぜ出来ない？【news23】｜TBS NEWS DIG - YouTube

新しいウィンドウで開く](https://www.youtube.com/watch?v=gmANcX8KEP8)[

![](https://t2.gstatic.com/faviconV2?url=https://political-finance-database.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

political-finance-database.com

TOP｜政治資金収支報告書データベース

新しいウィンドウで開く](https://political-finance-database.com/)[

![](https://t2.gstatic.com/faviconV2?url=https://media.paypay-sec.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

media.paypay-sec.co.jp

大阪IRとは？ カジノや関連銘柄は？ | 資産運用の 1st STEP

新しいウィンドウで開く](https://media.paypay-sec.co.jp/cat1/0508-ir)[

![](https://t2.gstatic.com/faviconV2?url=https://www.city.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

city.osaka.lg.jp

統合型リゾート 大阪ＩＲ

新しいウィンドウで開く](https://www.city.osaka.lg.jp/contents/wdu220/osakair/)[

![](https://t3.gstatic.com/faviconV2?url=https://skyscrapers-and-urbandevelopment.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

skyscrapers-and-urbandevelopment.com

大阪・夢洲地区特定複合観光施設設置運営事業 (大阪IR) | 超高層ビル・都市開発研究所

新しいウィンドウで開く](https://skyscrapers-and-urbandevelopment.com/page-256/page-4487/page-4496/page-27138/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

IR事業について - 大阪・夢洲地区特定複合観光施設区域の整備に関する計画(案) 抜粋 - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/documents/2236/09-04_shiryo9.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://kabutan.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kabutan.jp

万博＆カジノで変貌へ、ドリームアイランド「夢洲」関連株に活況再び ＜株探トップ特集

新しいウィンドウで開く](https://kabutan.jp/news/marketnews/?b=n202411180994)[

![](https://t2.gstatic.com/faviconV2?url=https://jair.report/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jair.report

大阪府・市がIR計画案を公開 MGM・オリックスに加え地元20社が出資 | JaIR

新しいウィンドウで開く](https://jair.report/article/771/)[

![](https://t1.gstatic.com/faviconV2?url=https://2009-2017.state.gov/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

2009-2017.state.gov

Macau - State.gov

新しいウィンドウで開く](https://2009-2017.state.gov/j/inl/rls/nrcrpt/2016/vol2/253419.htm)[

![](https://t0.gstatic.com/faviconV2?url=https://www.researchgate.net/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

researchgate.net

(PDF) The History of Gambling in Hong Kong and Macao - ResearchGate

新しいウィンドウで開く](https://www.researchgate.net/publication/303842055_The_History_of_Gambling_in_Hong_Kong_and_Macao)[

![](https://t2.gstatic.com/faviconV2?url=https://en.wikipedia.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

en.wikipedia.org

Gambling in Macau - Wikipedia

新しいウィンドウで開く](https://en.wikipedia.org/wiki/Gambling_in_Macau)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mha.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mha.gov.sg

Commencement of the Casino Control (Amendment) Act on 30 October 2024

新しいウィンドウで開く](https://www.mha.gov.sg/mediaroom/press-releases/commencement-of-the-casino-control-amendment-act-on-30-october-2024/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.acgcs.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

acgcs.org

The History and Development of Casino Gaming in Macau

新しいウィンドウで開く](https://www.acgcs.org/articles/the-history-and-development-of-casino-gaming-in-macau)[

![](https://t3.gstatic.com/faviconV2?url=https://sso.agc.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

sso.agc.gov.sg

Casino Control (Amendment) Act 2024 - Singapore Statutes Online

新しいウィンドウで開く](https://sso.agc.gov.sg/Details/GetAmendingLegislation?SourceDocumentId=a2153909-1b91-45da-aa12-3b5db09c54f6&SourceValidDate=20241030&SourceTransactionDate=20241003&SourcePublishDate=20241003&SourceDocStatus=published&HistoryType=amend&SourceDocType=Act&SourceNo=29&SourceYear=2024)[

![](https://t1.gstatic.com/faviconV2?url=https://www.parliament.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

parliament.gov.sg

Casino Control (Amendment) Bill - Parliament of Singapore

新しいウィンドウで開く](https://www.parliament.gov.sg/docs/default-source/bills-introduced/casino-control-\(amendment\)-bill-24-2024.pdf?sfvrsn=a1ba5608_1)[

![](https://t2.gstatic.com/faviconV2?url=https://www.hg.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

hg.org

Rules on Junket Operations in Macau - HG.org

新しいウィンドウで開く](https://www.hg.org/legal-articles/rules-on-junket-operations-in-macau-19495)[

![](https://t1.gstatic.com/faviconV2?url=https://agbrief.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

agbrief.com

Changes to the Singapore Casino Control Act enforced | AGB - Asia Gaming Brief

新しいウィンドウで開く](https://agbrief.com/news/singapore/31/10/2024/changes-to-singapore-casino-control-act-enforced/)[

![](https://t3.gstatic.com/faviconV2?url=https://www.uscc.gov/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

uscc.gov

SECTION 3: MACAU AND HONG KONG - U.S.-China Economic and Security Review Commission

新しいウィンドウで開く](https://www.uscc.gov/sites/default/files/Annual_Report/Chapters/Chapter%203%3B%20Section%203%20Macau%20and%20Hong%20Kong.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mha.gov.sg/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mha.gov.sg

Casino Control (Amendment) Bill - Ministry of Home Affairs (MHA)

新しいウィンドウで開く](https://www.mha.gov.sg/mediaroom/press-releases/casino-control-amendment-bill/)[

![](https://t1.gstatic.com/faviconV2?url=https://practiceguides.chambers.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

practiceguides.chambers.com

Gaming Law 2024 - Singapore | Global Practice Guides - Chambers and Partners

新しいウィンドウで開く](https://practiceguides.chambers.com/practice-guides/gaming-law-2024/singapore)[

![](https://t2.gstatic.com/faviconV2?url=https://www.aljazeera.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

aljazeera.com

Macau jails gambling 'junket king' Alvin Chau for 18 years | Courts ...

新しいウィンドウで開く](https://www.aljazeera.com/news/2023/1/18/macau-convicts-gambling-junket-king-alvin-chau)[

![](https://t0.gstatic.com/faviconV2?url=https://www.straitstimes.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

straitstimes.com

Marina Bay Sands said to end lawsuit with $9.1 million payment to ...

新しいウィンドウで開く](https://www.straitstimes.com/business/companies-markets/marina-bay-sands-said-to-end-lawsuit-with-91-million-payment-to-former)[

![](https://t0.gstatic.com/faviconV2?url=https://www.soumu.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

soumu.go.jp

政治資金収支報告書 - 政党本部｜日本維新の会 - 総務省

新しいウィンドウで開く](https://www.soumu.go.jp/senkyo/seiji_s/seijishikin/reports/SS20241129/SF/000070.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.pa.kkr.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pa.kkr.mlit.go.jp

大阪港夢洲地区の交通対策について - 近畿地方整備局港湾空港部

新しいウィンドウで開く](https://www.pa.kkr.mlit.go.jp/kbutsuryu/pdf/37/filek_37_2.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.kkr.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kkr.mlit.go.jp

万博関連事業に配慮した夢洲コンテナ ターミナルの整備方針について ～大阪・関西万博開催時

新しいウィンドウで開く](https://www.kkr.mlit.go.jp/plan/happyou/thesises/2022/ol9a8v00000574ex-att/katuryoku1-3.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.city.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

city.osaka.lg.jp

大阪港の港湾施設の「立入禁止区域」について

新しいウィンドウで開く](https://www.city.osaka.lg.jp/port/page/0000062374.html)[

![](https://t2.gstatic.com/faviconV2?url=https://www.expo2025.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

expo2025.or.jp

大阪・関西万博 来場者輸送具体方針(アクションプラン) 第4版

新しいウィンドウで開く](https://www.expo2025.or.jp/wp/wp-content/uploads/expo2025_raijyoushayusougutaihousin_04_honpen_240719_3r.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://web.dict-tml.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

web.dict-tml.co.jp

時間外及び HDS 専用レーン利用案内(改定) - DICT Web

新しいウィンドウで開く](https://web.dict-tml.co.jp/Manual/kitei.pdf?version=1.0)[

![](https://t1.gstatic.com/faviconV2?url=http://www.kinyobi.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kinyobi.co.jp

関電役員と子会社、自民団体に40年間で約３億6000万円献金 - 週刊金曜日

新しいウィンドウで開く](http://www.kinyobi.co.jp/kinyobinews/2019/11/07/antena-586/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.jcp-osaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp-osaka.jp

一夜で収入9474万円大阪維新の会政治資金パーティー「身を切る改革」のでたらめぶり露わ

新しいウィンドウで開く](https://www.jcp-osaka.jp/osaka_now/9579)[

![](https://t2.gstatic.com/faviconV2?url=https://www.jcp.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp.or.jp

馬場代表・業界幹部 発起人/維新、パーティー案内/“自主規制”前に駆け込み - 日本共産党

新しいウィンドウで開く](https://www.jcp.or.jp/akahata/aik24/2024-04-30/2024043011_01_0.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.youtube.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

youtube.com

大阪維新の会が政治資金パーティー廃止へ 日本維新の会は“改革案”を発表…企業や団体に対するパーティー券の販売や献金を禁止に（2024年1月29日） - YouTube

新しいウィンドウで開く](https://www.youtube.com/watch?v=_Poe8MPjRA8)[

![](https://t0.gstatic.com/faviconV2?url=https://www.jcp-osaka.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcp-osaka.jp

パーティーで９億３千万円16年政治資金収支報告書公表 - 日本共産党大阪府委員会

新しいウィンドウで開く](https://www.jcp-osaka.jp/osaka_now/5917)[

![](https://t1.gstatic.com/faviconV2?url=https://www.takenaka.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

takenaka.co.jp

有価証券報告書 - 竹中工務店

新しいウィンドウで開く](https://www.takenaka.co.jp/corp/bspl/pdf/2023_86.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://www.takenaka.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

takenaka.co.jp

有価証券報告書 - 竹中工務店

新しいウィンドウで開く](https://www.takenaka.co.jp/corp/bspl/pdf/2022_85.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

令和 3年分 - 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/documents/15104/03bb0232.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://m.youtube.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

m.youtube.com

【大阪IR】本契約に相当する「実施協定」を締結 アメリカのIR事業者トップが来日【関西テレビ・newsランナー】 - YouTube

新しいウィンドウで開く](https://m.youtube.com/watch?v=frkqqQHXgz8)[

![](https://t3.gstatic.com/faviconV2?url=https://ja.wikipedia.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

ja.wikipedia.org

大阪IR - Wikipedia

新しいウィンドウで開く](https://ja.wikipedia.org/wiki/%E5%A4%A7%E9%98%AAIR)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

大阪・夢洲地区のＩＲ区域整備計画に係る実施協定を認可 | 2023年 | 報道発表 | 観光庁

新しいウィンドウで開く](https://www.mlit.go.jp/kankocho/news11_000001_00004.html)[

![](https://t0.gstatic.com/faviconV2?url=https://note.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

note.com

2023年9月28日契約の夢洲IR実施協定等の書面｜大阪モニ太 - note

新しいウィンドウで開く](https://note.com/osakamonita/n/n82513868be90)[

![](https://t1.gstatic.com/faviconV2?url=https://www.shugiin.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

shugiin.go.jp

特定複合観光施設区域整備法 - 衆議院

新しいウィンドウで開く](https://www.shugiin.go.jp/internet/itdb_housei.nsf/html/housei/19620180727080.htm)[

![](https://t2.gstatic.com/faviconV2?url=https://www.japaneselawtranslation.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

japaneselawtranslation.go.jp

特定複合観光施設区域整備法 - 日本語／英語 - Japanese Law Translation

新しいウィンドウで開く](https://www.japaneselawtranslation.go.jp/ja/laws/view/3518)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mlit.go.jp

大阪・夢洲地区のＩＲ区域整備計画に係る実施協定を認可 - 国土交通省

新しいウィンドウで開く](https://www.mlit.go.jp/kankocho/content/001631878.pdf)[

![](https://t1.gstatic.com/faviconV2?url=https://www.beauty-kadan.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

beauty-kadan.co.jp

コンプライアンス体制｜経営方針・指針｜IR情報 - ビューティカダンホールディングス

新しいウィンドウで開く](https://www.beauty-kadan.co.jp/ir/compliance.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.medical-net.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

medical-net.com

コンプライアンス方針 - 投資家情報（IR） | 株式会社メディカルネット

新しいウィンドウで開く](https://www.medical-net.com/ir/policy/compliance/)[

![](https://t3.gstatic.com/faviconV2?url=https://www.softbank.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

softbank.jp

コンプライアンス | 企業・IR - ソフトバンク

新しいウィンドウで開く](https://www.softbank.jp/corp/aboutus/governance/compliance/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.kirinholdings.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kirinholdings.com

コンプライアンス | コーポレートガバナンス | KIRIN - キリンホールディングス株式会社

新しいウィンドウで開く](https://www.kirinholdings.com/jp/company/governance/compliance/)[

![](https://t0.gstatic.com/faviconV2?url=https://www.smfg.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

smfg.co.jp

コンプライアンス体制 - 三井住友フィナンシャルグループ

新しいウィンドウで開く](https://www.smfg.co.jp/company/organization/compliance.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.nomuraholdings.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

nomuraholdings.com

コンプライアンス | 野村グループについて - Nomura

新しいウィンドウで開く](https://www.nomuraholdings.com/jp/company/compliance.html)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

犯罪による収益の移転防止に関する法律 - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/419AC0000000022/)[

![](https://t1.gstatic.com/faviconV2?url=https://www.seiho.or.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

seiho.or.jp

マネー・ローンダリング／テロ資金供与 対策ハンドブック - 生命保険協会

新しいウィンドウで開く](https://www.seiho.or.jp/activity/guideline/pdf/laundering.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.dnp.co.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

dnp.co.jp

犯罪収益移転防止法とは？オンラインでの本人確認「eKYC」も解説 - DNP 大日本印刷

新しいウィンドウで開く](https://www.dnp.co.jp/biz/column/detail/20172056_4969.html)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

マネー・ローンダリング対策等について

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/ir_kaigi/dai5/siryou5.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.soumu.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

soumu.go.jp

犯罪収益移転防止法について（電話受付代行業・電話転送サービス事業者向け） - 総務省

新しいウィンドウで開く](https://www.soumu.go.jp/main_sosiki/joho_tsusin/d_syohi/money/top.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.npa.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

npa.go.jp

犯罪収益移転防止に関する 年 次 報 告 書 （令和５年） 概要版 - 警察庁

新しいウィンドウで開く](https://www.npa.go.jp/sosikihanzai/jafic/nenzihokoku/data/nennzi_gaiyou2023.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.fatf-gafi.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

fatf-gafi.org

対日相互審査 報告書概要(仮訳) - FATF

新しいウィンドウで開く](https://www.fatf-gafi.org/content/dam/fatf-gafi/mer/MER%20Japan%20_japanese_%20Summary%20Report%20on%20Banking%20Supervision.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://www.mof.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

mof.go.jp

対日相互審査報告書の概要（仮訳・未定稿） - 財務省

新しいウィンドウで開く](https://www.mof.go.jp/policy/international_policy/convention/fatf/20210830.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://kpmg.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kpmg.com

FATF第4次対日相互審査のフォローアップ状況 - KPMGジャパン

新しいウィンドウで開く](https://kpmg.com/jp/ja/home/insights/2024/02/fatf-aml-japan-2024.html)[

![](https://t0.gstatic.com/faviconV2?url=https://www.youtube.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

youtube.com

【名古屋税関】中部国際空港CIQ広報展示室を紹介します - YouTube

新しいウィンドウで開く](https://www.youtube.com/shorts/SWAplq5_nVg)[

![](https://t1.gstatic.com/faviconV2?url=https://asgam.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

asgam.jp

アルヴィン・チャウ氏が反撃: 豪メディアのThe Ageに「虚偽の報道」で法的措置を開始 報道の完全撤回を求め「重大な金銭的ダメージ」を主張 - IAG Japan

新しいウィンドウで開く](https://asgam.jp/2019/08/19/alvin-chau-fights-back-initiates-legal-action-against-australian-media-outlet-the-age-for-false-reporting-seeks-full-retraction-and-claims-significant-monetary-damages-jp/)[

![](https://t3.gstatic.com/faviconV2?url=https://www.macaushimbun.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

macaushimbun.com

マカオ、カジノ仲介サンシティ創業者に禁錮18年の判決…巨額の民事賠償も

新しいウィンドウで開く](https://www.macaushimbun.com/archives/41088)[

![](https://t3.gstatic.com/faviconV2?url=https://japan.ajunews.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

japan.ajunews.com

文体部、新しい外国人カジノ運営許可···GKLに続いて19年ぶり - 亜州日報

新しいウィンドウで開く](https://japan.ajunews.com/view/20240124171843118)[

![](https://t2.gstatic.com/faviconV2?url=https://www.donga.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

donga.com

外国人専用カジノ、さらに３ヵ所許可へ | 東亜日報

新しいウィンドウで開く](https://www.donga.com/jp/article/all/20040903/282729/1)[

![](https://t2.gstatic.com/faviconV2?url=https://ombudsman.kotra.or.kr/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

ombudsman.kotra.or.kr

外国人によるカジノ開設 規制緩和へ詳細を見る | 投資ニュース | InvestKOREA(JPN)

新しいウィンドウで開く](https://ombudsman.kotra.or.kr/ik-jp/bbs/i-832/detail.do?ntt_sn=45950)[

![](https://t2.gstatic.com/faviconV2?url=https://www.nri.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

nri.com

バングラデシュ中央銀行での 不正送金事件の余波 - Nomura Research Institute (NRI)

新しいウィンドウで開く](https://www.nri.com/content/900035592.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://piyolog.hatenadiary.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

piyolog.hatenadiary.jp

バングラデシュ中央銀行の不正送金についてまとめてみた - piyolog

新しいウィンドウで開く](https://piyolog.hatenadiary.jp/entry/20160315/1458056459)[

![](https://t3.gstatic.com/faviconV2?url=https://www.macaushimbun.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

macaushimbun.com

マカオ、カジノ法改正案の内容が明らかに…ライセンス最多6枚、契約期間は最長10年など | マカオ新聞｜The Macau Shimbun

新しいウィンドウで開く](https://www.macaushimbun.com/archives/37247)[

![](https://t2.gstatic.com/faviconV2?url=https://jair.report/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jair.report

【海外版・1/27～2/2 IR記事まとめ】米国ゲーミング協会はバイデン政権に期待、マカオ優先接種者にカジノディーラー (2/2) | JaIR -日本型IRビジネスレポート-

新しいウィンドウで開く](https://jair.report/article/567/2/)[

![](https://t3.gstatic.com/faviconV2?url=https://casinojapan-inc.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

casinojapan-inc.jp

変わりゆくマカオカジノ業界の現状

新しいウィンドウで開く](https://casinojapan-inc.jp/feature-macau/)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

116 5. マカオ (1) IR・カジノの概況 1） マカオのカジノ市場 マカオでは、1847 年にポルトガル政府

新しいウィンドウで開く](https://www.jcrc.go.jp/content/000000171.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://en.wikipedia.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

en.wikipedia.org

Gambling in Singapore - Wikipedia

新しいウィンドウで開く](https://en.wikipedia.org/wiki/Gambling_in_Singapore)[

![](https://t0.gstatic.com/faviconV2?url=https://www.pntr.gov.ph/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pntr.gov.ph

junket casino | www.pntr.gov.ph

新しいウィンドウで開く](https://www.pntr.gov.ph/ebvuavtz/)[

![](https://t3.gstatic.com/faviconV2?url=https://wwwtb.mlit.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

wwwtb.mlit.go.jp

国際航海船舶及び国際港湾施設の保安の確保等に関する法律に基づく手続きについて

新しいウィンドウで開く](https://wwwtb.mlit.go.jp/kanto/kaijou_annzen/hoan/hoan.htm)[

![](https://t1.gstatic.com/faviconV2?url=https://www.pref.osaka.lg.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

pref.osaka.lg.jp

大阪・夢洲地区特定複合観光施設区域の整備に関する計画 大阪府

新しいウィンドウで開く](https://www.pref.osaka.lg.jp/documents/3409/kuikiseibikeikaku_202505.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://www.legislation.act.gov.au/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

legislation.act.gov.au

Casino Control (Amendment) Bill 1994 - ACT Legislation Register

新しいウィンドウで開く](https://www.legislation.act.gov.au/b/db_14756/19941110-16755/pdf/db_14756.pdf)[

![](https://t3.gstatic.com/faviconV2?url=https://www.jcrc.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

jcrc.go.jp

カジノ事業等の規制について

新しいウィンドウで開く](https://www.jcrc.go.jp/content/000000916.pdf)[

![](https://t0.gstatic.com/faviconV2?url=https://laws.e-gov.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

laws.e-gov.go.jp

カジノ管理委員会関係特定複合観光施設区域整備法施行規則 - e-Gov 法令検索

新しいウィンドウで開く](https://laws.e-gov.go.jp/law/503M62000000001)[

![](https://t3.gstatic.com/faviconV2?url=https://www.kantei.go.jp/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

kantei.go.jp

特定複合観光施設区域整備法に係る説明会 説明資料

新しいウィンドウで開く](https://www.kantei.go.jp/jp/singi/ir_promotion/horitsusetsumeikai/setumei_siryou.pdf)[

![](https://t2.gstatic.com/faviconV2?url=http://www.japic.org/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

japic.org

カジノ管理委員会規則等 意見集約資料

新しいウィンドウで開く](http://www.japic.org/information/assets_c/2021/06/20210615_02.pdf)[

![](https://t2.gstatic.com/faviconV2?url=https://doi-kazuyoshi.com/&client=BARD&type=FAVICON&size=256&fallback_opts=TYPE,SIZE,URL)

doi-kazuyoshi.com

令和3年分政治資金収支報告書を提出 - 四條畷市議会議員 土井かずよし公式ウェブサイト

新しいウィンドウで開く](https://doi-kazuyoshi.com/news/135/)

思考プロセス