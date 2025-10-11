

# **Browserbaseに関する調査報告書：テクノロジー、プライバシー、および資金的関連性の分析**

### **Executive Summary**

本報告書は、AIエージェント向けブラウザインフラストラクチャサービス「Browserbase」について、その技術的特性、プライバシーポリシー、法的コンプライアンス、および資金調達の背景を網羅的に調査・分析したものである。本調査は、AIモデルが同サービスを「極めて危険」と警告したことに端を発するものであり、その警告の妥当性を客観的証拠に基づき検証することを目的とする。

* **技術評価:** Browserbaseは「ヘッドレスブラウザ」と呼ばれる高度な技術プラットフォームであり、その中核的価値提案にはウェブサイトのセキュリティ対策を回避するために設計された「ステルス」機能が含まれる。これは本質的に「デュアルユース（両義的用途）」のリスクを生み出し、正当な自動化と潜在的な違法行為の両方にとって強力なツールとなっている。  
* **法的・プライバシー評価:** 同社のプライバシーポリシーは、B2B SaaSプロバイダーとして標準的なものであり、その文言自体に「異常性」は見られない。AIモデルが警告した危険性は、セッション記録などの標準的なデータ収集が、あらゆる第三者のウェブサイトと対話し、機密性の高いユーザーデータを取得しうるサービスに適用されるという*文脈的リスク*に起因する可能性が高い。  
* **犯罪リスク評価:** サービスの機能（スケーラビリティ、匿名性、自動化）は、データ収集、詐欺、偽情報工作などに関与する高度な犯罪組織の運用ニーズと高い「親和性」を持つ。主な抑止力は同社の利用規約であるが、その実効的な施行には重大な課題が存在する。  
* **財務デューデリジェンス:** ジョージ・ソロス氏、ソロス・ファンド・マネジメント、あるいはオープン・ソサエティ財団によるBrowserbase Inc.への**直接的または間接的な資金提供の証拠は一切確認されなかった**。調査の結果、Browserbaseの投資家の一社（Kleiner Perkins）とソロス氏関連のファンドとの間に、10年以上前の無関係なセクターにおける共同投資という希薄な歴史的接点が見出されたが、これはベンチャーキャピタル業界では一般的な事象であり、現在の関係性や影響力を示唆するものではない。  
* **結論:** 「極めて危険」というAIによる警告は、誇張された表現ではあるものの、プラットフォームが持つ強力なデュアルユース能力を評価したものであり、全く根拠がないわけではない。そのリスクは隠された陰謀にあるのではなく、公然と提供されているツール自体の能力に内在している。

---

## **第1章 デジタルゴーストの解剖：Browserbaseプラットフォームの分解**

### **目的**

本章では、Browserbaseのサービスについて、マーケティング用語の裏にある中核的な能力と、特に「ステルス」機能が持つ意味合いを分析し、基礎的かつ技術的な理解を提供することを目的とする。

### **1.1. サービスの定義：インフラとしてのヘッドレスブラウザ**

Browserbaseは、「ヘッドレスブラウザ」（グラフィカルユーザーインターフェースを持たないウェブブラウザ）を大規模に実行、管理、監視するためのプラットフォームである 1。開発者が自身のブラウザ群を維持管理する手間を省く、インフラストラクチャー・アズ・ア・サービス（IaaS）として市場に提供されている 2。

このサービスは、Playwright、Puppeteer、Seleniumといった一般的な自動化フレームワークと統合可能であり、開発者は既存のコードを流用して利用することができる 1。主な想定用途としては、ワークフローの自動化、AIエージェント開発、ウェブスクレイピングが挙げられている 3。顧客事例として、ウェブサイト最適化のCoframeやセールスインテリジェンスのAomniなどが紹介されている 3。

### **1.2. 「ステルス」という価値提案：回避のためのツール**

同社が強力にマーケティングしている中核的な機能群が「ステルスモード」である 3。これは付随的な機能ではなく、ボット対策の防御を回避することで「自動化をスムーズに実行し続ける」ことを目的とした、価値提案の中心部分を成している。

**ステルス機能の主要構成要素：**

* **CAPTCHA自動解決:** 人間とボットを区別するために設計された認証チャレンジを、サービスが自動的に解決する 1。  
* **レジデンシャルプロキシ:** トラフィックを一般家庭用のインターネット接続に関連付けられたIPアドレス経由でルーティングする。これにより、自動化されたブラウザが通常の家庭ユーザーのように見え、ブロックされにくくなる 1。  
* **ブラウザフィンガープリント生成:** ブラウザのバージョン、プラグイン、画面解像度など、実際のユーザーブラウザが持つ固有の特性を模倣し、高度なフィンガープリント技術による検出を回避する 1。

さらに、このサービスは堅牢な監視ツールも提供しており、リアルタイムでセッションを監視する「ライブビューiFrame」や、過去のセッションをデバッグするための「セッション記録」機能が含まれる 1。

これらの機能は、Browserbaseのビジネスモデルが本質的に技術的な軍拡競争に基づいていることを示している。ウェブサイトは自らのデータやインフラを保護するために、CAPTCHA、IPブロッキング、フィンガープリントといったボット対策やスクレイピング対策を開発・導入する。それに対し、Browserbaseはこれらのセキュリティ対策を打ち破るために明確に設計されたサービスを販売している。この構造は、Browserbaseを中立的なツールではなく、セキュリティプロトコルの回避を積極的に可能にする存在として位置づける。「自動化をスムーズに実行し続ける」 3 というマーケティング文句は、「自動化がブロックされるのを防ぐ」という実態を婉曲的に表現したものである。したがって、Browserbaseの商業的成功は、他社のウェブサイトが投じるセキュリティ投資をいかに効果的に無力化できるかに直接結びついている。これこそが、プラットフォームが内包する根本的な「デュアルユース」の緊張関係である。

---

## **第2章 デジタル契約：Browserbaseプライバシーポリシーの法医学的分析**

### **目的**

本章では、Browserbaseのプライバシーポリシーを精査し、その条項が利用者の指摘するように「異常」または本質的に危険なものであるかを判断する。

### **2.1. 収集されるデータ：彼らが集めるもの**

プライバシーポリシー 13 は、以下の標準的なカテゴリのデータ収集を明記している。

* **プロフィール／連絡先データ:** 氏名、メールアドレスなど。  
* **支払いデータ:** 金融口座情報、請求先住所など（Stripeなどの第三者によって処理される）14。  
* **デバイス／IPデータ:** IPアドレス。  
* **ウェブ分析データ:** Browserbase自身のサービスとのインタラクション（例：ウェブサイト上のクリック）。  
* **地理位置情報データ:** IPアドレスから派生。

これらすべてのカテゴリにおける収集目的は、「サービスの提供、カスタマイズ、改善、サービスのマーケティング、および顧客との連絡」という広範なものであると記載されている 13。

### **2.2. 第三者への共有：データの行き先**

データは、標準的なビジネスパートナーと共有される。これには、ホスティングプロバイダー、決済代行業者（Stripe）、分析プロバイダー、セキュリティコンサルタントが含まれる 13。また、法的義務の遵守、権利の保護、または違法行為の調査のために、政府機関や法執行機関にデータが開示される可能性があるが、これは標準的な条項である 13。合併や買収の際には、収集されたすべてのデータが新しい事業体に譲渡される可能性がある 13。

### **2.3. データ保持とプライバシーに影響する主要機能**

* **セッション記録:** プライバシーの観点から最も重要な機能である。Browserbaseは、デバッグ目的でユーザーセッションを最大30日間記録することがある 11。  
* **データ保持期間:** ポリシーは目的ベースであり、具体的な期間はデータカテゴリによって異なる。プロフィール情報はアカウントが存在する限り、セッション記録は30日間保持される 13。最上位の「Scale」プランでは90日以上の保持も可能である 4。  
* **ユーザーの責任:** ポリシーは、セッション中に扱われるあらゆるデータの処理権限を確保する責任を、明確にユーザーに課している。ユーザーは「適切なデータプライバシーおよびセキュリティ対策を講じている場合にのみ、この機能を使用すべきである」とされている 13。

AIがこのポリシーの「異常性」について警告を発した理由は、法的な文言そのものではなく、Browserbaseの機能という文脈におけるこれらの標準的な条項が作り出す*リスクプロファイル*に対する高度な推論から生じた可能性が高い。標準的なSaaS企業は、自社のアプリケーション内でのユーザーのインタラクションを記録する。これはリスクが低い。対照的に、Browserbaseの「セッション」とは、ヘッドレスブラウザが*インターネット上のあらゆるウェブサイト*と行うインタラクションを指す 2。

もしユーザーが自身の銀行口座、患者の医療ポータル（同サービスはHIPAA準拠を謳っている 3）、あるいは機密性の高い企業システムへのアクセスを自動化した場合、セッション記録は認証情報、個人識別情報（PII）、保護医療情報（PHI）、および企業の専有データをキャプチャする可能性がある。プライバシーポリシー 13 は、Browserbaseがこれらの記録を30日間保存することを許可している。同社はロギングを無効にするオプションを提供しているものの 12、デバッグ目的で記録がデフォルトで有効になっている性質上、潜在的に大規模なデータ漏洩の危険性を生み出している。したがって、AIは「標準的なポリシー」が「非標準的なサービス」に適用されることは「異常なリスク」に等しいと結論付けた可能性が高い。危険は、ポリシーに記述された悪意ある意図ではなく、その標準的な条項の下で偶発的または意図的に収集・保存されうるデータの重大性にある。

---

## **第3章 法の遵守：米国の規制コンプライアンス監査**

### **目的**

本章では、Browserbaseが公表しているポリシーとマーケティング上のコンプライアンス表明を、米国の主要な連邦法および州法と照合し、明確な遵守領域と潜在的な法的摩擦点を特定する。

### **3.1. プライバシー法コンプライアンス（COPPA、CPRA）**

* **COPPA（児童オンラインプライバシー保護法）:** 同社は明確な遵守の意図を示している。プライバシーポリシー 13 および利用規約 15 は、サービスが13歳未満の子供向けではないことを明記し、子供から収集したデータを削除する手続きを含んでいる。  
* **州プライバシー法（例：カリフォルニア州のCPRA）:** ポリシーには「特定の州法」に基づくプライバシー権に関するセクションが含まれ、カリフォルニア州とネバダ州に言及している 13。これは州レベルの義務に対する認識と、形式的な対応の試みを示している。

### **3.2. エンタープライズコンプライアンス（HIPAA、SOC 2）**

Browserbaseは、信頼性の高い企業向け標準への準拠を強力にアピールしている。同社はSOC 2 Type I認証を取得済みで、HIPAAに準拠しており、顧客に業務提携契約（BAA）を提供している 3。これは、ゼロトラスト・ブラウザ分離（ブラウザごとに専用VM）、ネットワーク分離、透明性のあるデータ処理制御といったセキュアなアーキテクチャへの多大な投資を示している 12。これは医療や金融などの規制産業における企業への直接的なアピールである。

### **3.3. コンピュータ詐欺・濫用防止法（CFAA）のグレーゾーン**

CFAAは、「権限なく」または「与えられた権限を超えて」コンピュータにアクセスすることを禁じている。多くのウェブサイトの利用規約は一種のアクセス権限を構成しており、これらの規約はしばしば自動アクセスやスクレイピングを明確に禁止している。

ユーザーがBrowserbaseの「ステルス」機能を利用してスクレイピング対策を回避することは、対象サイトの規約に違反し、それによって「与えられた権限を超えた」アクセスを行っていると見なされる可能性がある。主たる行為者はユーザーであるが、Browserbaseは回避を目的として作られたツールを提供する者として、違反を助長または幇助したという法的に曖昧な立場に置かれる。彼らの防御は、違法な使用を禁じ、すべての責任をユーザーに帰する自社の利用規約 15 に依存することになる。

このコンプライアンスへのアプローチは、Browserbaseが戦略的な二元性を持っていることを示唆している。一方では、企業の信頼を勝ち取るためにSOC 2やHIPAAのような厳格で監査可能なコンプライアンス基準を追求し、宣伝している。他方では、その中核技術はCFAAの法的グレーゾーンに存在する活動を助長している。これは根本的なビジネス上の矛盾を生み出している。つまり、同社はセキュリティとコンプライアンスを販売すると同時に、回避のためのツールも販売しているのである。この戦略は、自社と顧客との直接的な関係およびそのデータ（プライバシー法、セキュリティ基準）を規定する法律は厳格に遵守しつつ、顧客が第三者に対して行う活動（CFAA関連の問題）については、より寛容でユーザー責任に焦点を当てた姿勢を取るという、計算されたビジネス戦略であると考えられる。これにより、リスクを嫌う企業市場と、リスクを許容する自動化市場の両方を獲得することが可能になる。

| 法／基準 | 主要要件 | Browserbaseのポリシー／行動 | 証拠 | 評価 |
| :---- | :---- | :---- | :---- | :---- |
| **COPPA** | 13歳未満の子供からのデータ収集の禁止／削除 | 利用規約およびプライバシーポリシーで13歳未満の利用を禁止し、データ削除手順を明記。 | 13 | 準拠 |
| **CPRA (CA)** | 住民にアクセス権／削除権を提供 | カリフォルニア州住民向けの特定の権利に関するセクションをプライバシーポリシーに記載。 | 13 | 準拠しているように見える |
| **HIPAA** | 保護医療情報（PHI）のためにBAA（業務提携契約）を締結 | HIPAA準拠を宣伝し、BAAの提供を明記。セキュアなアーキテクチャを強調。 | 3 | 準拠 |
| **CFAA** | 権限のないアクセスを禁止 | 利用規約で違法な使用を禁止し、責任はユーザーにあると規定。しかし、中核機能はウェブサイトの利用規約違反を助長する。 | 15 | 法的に曖昧／高リスク |

---

## **第4章 違法利用の可能性評価：犯罪との「親和性」の検証**

### **目的**

本章では、人身売買のような重大犯罪との「親和性」に関する利用者の懸念に直接対応し、サービスの機能がどのように兵器化されうるかを冷静に分析する。

### **4.1. 悪意あるキャンペーンの構造**

高度なオンライン違法活動は、特定の技術的能力を必要とする。

* **規模（スケール）:** 数千人の標的を狙ったり、数千の偽アカウントを作成するため。Browserbaseは「ミリ秒単位で数千のブラウザ」を起動できると謳っている 3。  
* **匿名性:** 操作者の身元や場所を隠蔽するため。Browserbaseはレジデンシャルプロキシとフィンガープリント管理機能を提供する 1。  
* **回避:** セキュリティ対策を打ち破るため。BrowserbaseはCAPTCHAの自動解決機能を提供する 3。  
* **自動化:** 人間の介入なしに複雑な複数ステップのワークフローを実行するため。これはBrowserbaseの中核的な目的である 2。

### **4.2. 脅威モデリング：理論的な犯罪利用シナリオ**

* **人身売買:** エスコートサイト、ソーシャルメディア、クラシファイド広告サイトから大規模なデータ収集を自動化し、潜在的な被害者を特定、プロファイリング、追跡するために使用される可能性がある。また、手動では管理不可能な規模で、誘い出すための偽アカウントや欺瞞的な広告を大量に作成・管理することも可能である。  
* **大規模詐欺:** 金融機関に対するクレデンシャルスタッフィング攻撃の自動化、不正なクレジットや政府給付金の大量申請、多数の口座を横断する複雑なマネーロンダリングスキームの実行。  
* **偽情報とハラスメント:** プロパガンダの拡散、世論操作、あるいは個人や集団に対する協調的なハラスメントキャンペーンを行うために、数千の自動化されたソーシャルメディアボットを展開・管理する。  
* **恐喝のためのデータ収集:** 恐喝や脅迫の材料となる情報を集めるために、機密性の高いフォーラム、プライベートコミュニティ、またはデータ漏洩サイトを体系的にスクレイピングする。

### **4.3. 抑止力の限界：利用規約 vs 悪意**

Browserbaseの主要な防御策は、「法律に違反する方法」での使用を禁じる利用規約である 15。しかし、同社は他の多くのインターネットサービスプロバイダーとは異なり、禁止行為を具体的に列挙した詳細なアクセプタブルユースポリシー（AUP）を公表していない 16。同社のセキュリティ文書 12 は、ユーザーの監視ではなく、プラットフォーム自体のセキュリティに焦点を当てている。

ここには「施行のパラドックス」が存在する。違法な使用を効果的に取り締まるためには、Browserbaseは顧客の活動を綿密に監視する必要がある。しかし、これは同社がセールスポイントとして掲げるプライバシーと分離の原則に反する。匿名性を求めてこのツールを使用する犯罪行為者を、プライバシーを侵害するような監視なしに検出することは困難である。

さらに、サービスの価格設定モデルと機能セットは、意図せずして「理想的な」悪意ある行為者のプロファイルを作り出している。高度な犯罪組織は、最高の並行処理能力、最長のデータ保持期間、そして「高度なステルス」機能を提供する月額1,000ドル以上の「Scale」プランを利用する資金力を持つ可能性が高い 4。これは、最も危険な能力が、正当な趣味の開発者が避けるかもしれないが、資金力のある違法グループが必要な運営コストと見なすであろうペイウォールの背後に置かれていることを意味する。したがって、パワーユーザーからの収益を最大化するビジネスモデルが、最も危険なタイプのユーザーのニーズにも応えてしまう可能性がある。

---

## **第5章 資金の流れを追う：Browserbaseの企業・財務構造の深掘り**

### **目的**

本章では、創業者、資金調達源、そして利用者が特に懸念するジョージ・ソロス氏との関連性に焦点を当て、徹底的な財務および企業デューデリジェンス調査を実施する。

### **5.1. 企業プロファイル：BROWSERBASE INC.**

* **創業者:** Paul Klein IV氏。以前にStream Club（Mux社が買収）を創業し、Twilio社に勤務した経験を持つシリアルアントレプレナーである 18。単独の創業者である 21。  
* **法人:** BROWSERBASE INC.、2024年1月23日設立 23。  
* **所在地:** カリフォルニア州サンフランシスコ。記載されている住所は584 Castro St \#249であり、これはスタートアップがメールサービスを利用する際の一般的な慣行である 13。

### **5.2. 文書化された資金調達と主要投資家**

同社は急速に多額の資本を調達しており、設立後約15ヶ月で総額少なくとも6,750万ドルに達している 21。

* **シードラウンド（2024年6月）:** 650万ドル。Kleiner Perkinsが主導し、base caseなどが参加 25。  
* **シリーズA（2024年10月）:** 2,100万ドル。CRVとKleiner Perkinsが共同で主導し、Okta Venturesが参加 19。  
* **シリーズB（2025年4月／6月）:** 4,000万ドル。Notable Capital（旧GGV）が主導し、企業価値は3億ドルと評価 21。  
* **主要機関投資家:** Notable Capital, Kleiner Perkins, CRV, Okta Ventures, base case 19。  
* **主要エンジェル投資家:** Jeff Lawson氏 (Twilio), Patrick Collison氏 (Stripe), Guillermo Rauch氏 (Vercel) や、Okta, Stitch, WorkOSの創業者など、著名なテック起業家が名を連ねる 20。

| 資金調達ラウンド | 日付 | 調達額 | 主導投資家 | 他の著名な投資家 | 証拠 |
| :---- | :---- | :---- | :---- | :---- | :---- |
| **シード** | 2024年6月 | $6.5M | Kleiner Perkins | base case, AI Grant | 25 |
| **シリーズA** | 2024年10月 | $21M | CRV, Kleiner Perkins | Okta Ventures | 19 |
| **シリーズB** | 2025年4月/6月 | $40M | Notable Capital | CRV, Kleiner Perkins, Patrick Collison, Jeff Lawson | 21 |

### **5.3. ソロス氏に関する調査：資金的関連性の探索**

* **調査方法:** Browserbaseの全投資家リストを体系的にレビューし、次にBrowserbaseの投資家とジョージ・ソロス氏、ソロス・ファンド・マネジメント 30、またはオープン・ソサエティ財団（OSF）31 との間の関連性を調査した。  
* **直接的関連性の分析:** 提出されたどの文書においても、ジョージ・ソロス氏または彼の関連団体がBrowserbase Inc.に**直接投資したという証拠は一切存在しない** 21。  
* **間接的関連性の分析:**  
  * 調査はBrowserbaseの主要投資家であるKleiner Perkins、CRV、Notable Capitalに焦点を当てた。  
  * 調査の結果、**Kleiner Perkins**とソロス氏関連のファンドとの間に、歴史的かつ無関係な共同投資の事例が確認された。具体的には、2011年に両者は電力変換スタートアップのTransphorm社に投資している 34。また、Silver Lakeとソロス氏のパートナーシップであるSilver Lake Kraftwerkは、リサイクルプラスチックメーカーにKleiner Perkinsと共に共同投資している 35。  
  * これらの関連性は**歴史的**（10年以上前）、**間接的**（互いへの投資ではなく第三者企業への共同投資）、かつ**無関係なセクター**（クリーンテックであり、AI/ソフトウェアではない）のものである。  
  * CRVまたはNotable Capitalについては、提供された調査資料内に同様の関連性は見つからなかった。

利用者のソロス氏との関連性に関する問いは、複雑なネットワークの中からパターンを見出そうとする典型的な例であるが、これは弱く偶発的な歴史的接点を、意味のある現代的なつながりと誤認している。ベンチャーキャピタル業界の現実は、主要なファンドが頻繁に同じ案件に登場する、重複したネットワークで構成されている。特定された接点は、陰謀の証拠ではなく、10年前のVCエコシステムの正常な機能の現れである。したがって、この「ソロス氏との関連性」は、本件の核心から逸れた誤った手がかりであると結論付けられる。報告書は、利用者のこの懸念を完全に解消するため、この点を明確かつ曖昧さなく記述する必要がある。

---

## **第6章 統合と最終評価：「極めて危険」という警告の検証**

### **目的**

本章では、すべての調査結果を統合し、利用者の中心的な問いである「Browserbaseは『極めて危険』なのか、そしてAIの警告は正当化されるのか」について、最終的かつ多角的な判断を下す。

### **6.1. 「異常性」の再評価**

調査の結果、「異常性」は同社の法的な書類や資金調達源には存在しないと結論付けられる。プライバシーポリシーは標準的であり（第2章）、同社は主流の優良なシリコンバレーの投資家から支援を受けている（第5章）。

異常性、ひいては危険性は、**サービスの機能が持つ強力な組み合わせ**、すなわち、産業規模の自動化、高度な匿名性、そしてセキュリティ回避を目的として構築された機能が、使いやすいAPIにパッケージ化されている点に存在する。

### **6.2. デュアルユースのジレンマ：デジタルなバール**

Browserbaseは典型的な「デュアルユース」技術である。AIエージェント開発やワークフロー自動化といった、正当で生産性を向上させるタスクのために販売されている 6。しかし、その最も強力な機能は、欺瞞と回避を可能にするものである（第1章）。ユーザーレビューや議論では、その潜在能力と不安定さの両方が指摘されており、複雑なタスクを安定して実行させるのに苦労するユーザーがいる一方で 36、自動化に強力であると感じるユーザーもいる 10。

最も的確なアナロジーは、デジタルな「バール」である。セキュリティ専門家が脆弱性をテストするために使うこともできれば、泥棒が侵入するために使うこともできる。Browserbaseは、この強力なツールを製造・販売するビジネスであり、その利用規約は警告ラベルとして機能している。

### **6.3. 「極めて危険」という警告に関する最終判断**

AIモデルによる「極めて危険」という警告は、文脈的なリスク評価から導き出された、誇張されてはいるがもっともな結論である。サービスの能力を分析したAIは、大規模なセキュリティ回避を目的として設計されたツールが本質的に高リスクであると正しく特定するだろう。

その危険は隠されたり、陰謀めいたものではなく、製品の公然と宣伝されている機能である。リスクは、Browserbaseが密かに悪であるということではなく、悪意を持つ可能性のある他者に対して強力な武器を提供することにある。

したがって、利用者が抱くソロス氏が資金提供する陰謀という特定の恐怖は根拠がないものの（第5章）、サービスの害悪の可能性に対する全般的な警戒心は的外れではない。このサービスは危険な能力を凝縮しており、それゆえに「危険」とラベル付けすることは、悪意ある行為者の手に渡った場合の潜在的な影響を評価する上で、合理的な判断である。

### **6.4. 結論**

本報告書は、BROWSERBASE INC.が、強力なデュアルユースのサービスを提供する、正当で十分な資金力を持つテクノロジー企業であると結論付ける。そのプライバシーポリシーと法的枠組みは標準的であるが、サービスの中核的な機能は、犯罪活動における悪用の重大かつ否定できない可能性を提示している。AIによる警告は、警鐘を鳴らすものではあったが、この内在するリスクを正しく特定していた。我々の調査では、ジョージ・ソロス氏との資金的なつながりに関する利用者の懸念を裏付ける証拠は一切見つからなかった。Browserbaseの危険性は、その支援者にあるのではなく、同社が市場に投入したツールそのものが持つ力にある。

#### **引用文献**

1. How Browserbase Simplifies Web Automation for Developers \- The AI Library, 6月 18, 2025にアクセス、 [https://www.theailibrary.co/blog/how-browserbase-simplifies-web-automation-for-developers](https://www.theailibrary.co/blog/how-browserbase-simplifies-web-automation-for-developers)  
2. What is Browserbase? \- Browserbase Documentation, 6月 18, 2025にアクセス、 [https://docs.browserbase.com/introduction/what-is-browserbase](https://docs.browserbase.com/introduction/what-is-browserbase)  
3. Browserbase: A web browser for AI agents & applications, 6月 18, 2025にアクセス、 [https://www.browserbase.com/](https://www.browserbase.com/)  
4. Browserbase Pricing, Features and Get Free Demo \- Techimply, 6月 18, 2025にアクセス、 [https://www.techimply.com/profile/browserbase](https://www.techimply.com/profile/browserbase)  
5. Browserbase \- AI Agents Directory, 6月 18, 2025にアクセス、 [https://aiagentslist.com/agent/browserbase](https://aiagentslist.com/agent/browserbase)  
6. Browserbase gets AI Agents on the Web \- Cerebral Valley, 6月 18, 2025にアクセス、 [https://cerebralvalley.ai/blog/browserbase-gets-ai-agents-on-the-web-3FERIAA3pcN3Hnm4YiVuG8](https://cerebralvalley.ai/blog/browserbase-gets-ai-agents-on-the-web-3FERIAA3pcN3Hnm4YiVuG8)  
7. Browserbase \- WaytoAGI, 6月 18, 2025にアクセス、 [https://www.waytoagi.com/sites/2029](https://www.waytoagi.com/sites/2029)  
8. Browserbase Reviews \- 2025 \- Slashdot, 6月 18, 2025にアクセス、 [https://slashdot.org/software/p/Browserbase/](https://slashdot.org/software/p/Browserbase/)  
9. Browserbase \- ️ LangChain, 6月 18, 2025にアクセス、 [https://python.langchain.com/docs/integrations/providers/browserbase/](https://python.langchain.com/docs/integrations/providers/browserbase/)  
10. r/browserbase \- Reddit, 6月 18, 2025にアクセス、 [https://www.reddit.com/r/browserbase/](https://www.reddit.com/r/browserbase/)  
11. A web browser for AI agents & applications \- Browserbase, 6月 18, 2025にアクセス、 [https://www.browserbase.com/pricing](https://www.browserbase.com/pricing)  
12. Enterprise Security \- Browserbase Documentation, 6月 18, 2025にアクセス、 [https://docs.browserbase.com/guides/security](https://docs.browserbase.com/guides/security)  
13. Browserbase Privacy Policy \- Browserbase \- Headless Web Browser ..., 6月 18, 2025にアクセス、 [https://www.browserbase.com/privacy-policy](https://www.browserbase.com/privacy-policy)  
14. Browserbase Powers Web Browsing for AI Agents and Apps with Stripe's Usage-Based Billing, 6月 18, 2025にアクセス、 [https://stripe.com/it-si/customers/browserbase](https://stripe.com/it-si/customers/browserbase)  
15. Browserbase Terms of Service, 6月 18, 2025にアクセス、 [https://www.browserbase.com/terms-of-service](https://www.browserbase.com/terms-of-service)  
16. acceptable use policy \- Flow Business, 6月 18, 2025にアクセス、 [http://flowbusiness.co/acceptable-use-policy](http://flowbusiness.co/acceptable-use-policy)  
17. Acceptable Use Policy \- Dalet, 6月 18, 2025にアクセス、 [https://www.dalet.com/acceptable-use-policy/](https://www.dalet.com/acceptable-use-policy/)  
18. Browserbase's $27.5M Fundraising Journey in Just One Year for AI Web Automation, 6月 18, 2025にアクセス、 [https://aimresearch.co/market-industry/browserbases-27-5m-fundraising-journey-in-just-one-year-for-ai-web-automation](https://aimresearch.co/market-industry/browserbases-27-5m-fundraising-journey-in-just-one-year-for-ai-web-automation)  
19. Browserbase: Web Browser Automation Company Raises $21 Million (Series A) \- Pulse 2.0, 6月 18, 2025にアクセス、 [https://pulse2.com/browserbase-web-browser-automation-company-raises-21-million-series-a/](https://pulse2.com/browserbase-web-browser-automation-company-raises-21-million-series-a/)  
20. Browserbase Launches "Director" to Automate the Web for Everyone; Announces $40M Series B \- PR Newswire, 6月 18, 2025にアクセス、 [https://www.prnewswire.com/news-releases/browserbase-launches-director-to-automate-the-web-for-everyone-announces-40m-series-b-302483761.html](https://www.prnewswire.com/news-releases/browserbase-launches-director-to-automate-the-web-for-everyone-announces-40m-series-b-302483761.html)  
21. www.sourcery.vc, 6月 18, 2025にアクセス、 [https://www.sourcery.vc/p/breaking-browserbase-raises-40m-series](https://www.sourcery.vc/p/breaking-browserbase-raises-40m-series)  
22. Browserbase \- 2025 Founders and Board of Directors \- Tracxn, 6月 18, 2025にアクセス、 [https://tracxn.com/d/companies/browserbase/\_\_PntOqLzB\_NnS5mL0UWH1rWXoTe1IiUrvwIshsEEgxe8/founders-and-board-of-directors](https://tracxn.com/d/companies/browserbase/__PntOqLzB_NnS5mL0UWH1rWXoTe1IiUrvwIshsEEgxe8/founders-and-board-of-directors)  
23. Browserbase \- 2025 Company Profile & Funding \- Tracxn, 6月 18, 2025にアクセス、 [https://tracxn.com/d/companies/browserbase/\_\_PntOqLzB\_NnS5mL0UWH1rWXoTe1IiUrvwIshsEEgxe8](https://tracxn.com/d/companies/browserbase/__PntOqLzB_NnS5mL0UWH1rWXoTe1IiUrvwIshsEEgxe8)  
24. Browserbase 2025 Company Profile: Valuation, Funding & Investors | PitchBook, 6月 18, 2025にアクセス、 [https://pitchbook.com/profiles/company/593111-35](https://pitchbook.com/profiles/company/593111-35)  
25. 2025 Funding Rounds & List of Investors \- Browserbase \- Tracxn, 6月 18, 2025にアクセス、 [https://tracxn.com/d/companies/browserbase/\_\_PntOqLzB\_NnS5mL0UWH1rWXoTe1IiUrvwIshsEEgxe8/funding-and-investors](https://tracxn.com/d/companies/browserbase/__PntOqLzB_NnS5mL0UWH1rWXoTe1IiUrvwIshsEEgxe8/funding-and-investors)  
26. Browserbase raised $6.5M in seed funding led by Kleiner Perkins and angel investors to launch headless browser platform for AI-powered web automation. \- Fundz, 6月 18, 2025にアクセス、 [https://www.fundz.net/fundings/browserbase-funding-round-seed-5f4b90](https://www.fundz.net/fundings/browserbase-funding-round-seed-5f4b90)  
27. Browserbase Raises $6.5M in Seed Funding \- VC News Daily, 6月 18, 2025にアクセス、 [https://vcnewsdaily.com/browserbase/venture-capital-funding/lyqhnkzngq](https://vcnewsdaily.com/browserbase/venture-capital-funding/lyqhnkzngq)  
28. Browserbase reels in $40M for its browser automation tools \- SiliconANGLE, 6月 18, 2025にアクセス、 [https://siliconangle.com/2025/06/17/browserbase-reels-40m-browser-automation-tools/](https://siliconangle.com/2025/06/17/browserbase-reels-40m-browser-automation-tools/)  
29. Browserbase Secures $40 Million In Series B Round Led By Notable Capital With CRV And Kleiner Perkins \- Traded, 6月 18, 2025にアクセス、 [https://traded.co/vc/deal/browserbase-secures-40-million-in-series-b-round-led-by-notable-capital-with-crv-and-kleiner-perkins/](https://traded.co/vc/deal/browserbase-secures-40-million-in-series-b-round-led-by-notable-capital-with-crv-and-kleiner-perkins/)  
30. Soros Fund Management \- Wikipedia, 6月 18, 2025にアクセス、 [https://en.wikipedia.org/wiki/Soros\_Fund\_Management](https://en.wikipedia.org/wiki/Soros_Fund_Management)  
31. Open Society Foundations \- Wikipedia, 6月 18, 2025にアクセス、 [https://en.wikipedia.org/wiki/Open\_Society\_Foundations](https://en.wikipedia.org/wiki/Open_Society_Foundations)  
32. How We Fund \- Open Society Foundations, 6月 18, 2025にアクセス、 [https://www.opensocietyfoundations.org/how-we-work/how-we-fund](https://www.opensocietyfoundations.org/how-we-work/how-we-fund)  
33. Open Society Foundations, 6月 18, 2025にアクセス、 [https://www.opensocietyfoundations.org/](https://www.opensocietyfoundations.org/)  
34. Foundation Capital \- Gigaom, 6月 18, 2025にアクセス、 [https://gigaom.com/archives/foundation-capital.html](https://gigaom.com/archives/foundation-capital.html)  
35. Silver Lake Kraftwerk seals first non-US investment \- Private Debt Investor, 6月 18, 2025にアクセス、 [https://www.privatedebtinvestor.com/silver-lake-kraftwerk-seals-first-non-us-investment/](https://www.privatedebtinvestor.com/silver-lake-kraftwerk-seals-first-non-us-investment/)  
36. Reviewing BrowserBase: Building AI Agents with Automation & Web Scraping, 6月 18, 2025にアクセス、 [https://dicloak.com/blog-detail/reviewing-browserbase-building-ai-agents-with-automation--web-scraping](https://dicloak.com/blog-detail/reviewing-browserbase-building-ai-agents-with-automation--web-scraping)  
37. Browserbase Reviews in 2025 \- SourceForge, 6月 18, 2025にアクセス、 [https://sourceforge.net/software/product/Browserbase/](https://sourceforge.net/software/product/Browserbase/)  
38. Reviewing BrowserBase: Building AI Agents with Automation & Web Scraping \- YouTube, 6月 18, 2025にアクセス、 [https://www.youtube.com/watch?v=TIdz8yJ1-u0](https://www.youtube.com/watch?v=TIdz8yJ1-u0)  
39. Browserbase (and its MCP) is truly amazing- Its almost human like browsing..On par with OpenaI operator or Claude ComputerUse : r/MCPservers \- Reddit, 6月 18, 2025にアクセス、 [https://www.reddit.com/r/MCPservers/comments/1jzznxa/browserbase\_and\_its\_mcp\_is\_truly\_amazing\_its/](https://www.reddit.com/r/MCPservers/comments/1jzznxa/browserbase_and_its_mcp_is_truly_amazing_its/)  
40. What recommendations do you have for those using Browser AI and similar Browser Automation AI Tools? \- Reddit, 6月 18, 2025にアクセス、 [https://www.reddit.com/r/AI\_Agents/comments/1kl02wh/what\_recommendations\_do\_you\_have\_for\_those\_using/](https://www.reddit.com/r/AI_Agents/comments/1kl02wh/what_recommendations_do_you_have_for_those_using/)