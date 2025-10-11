

# **機械の中の虚偽：AI、プロパガンダ、情報戦の事実に基づいた解体**

## **序論**

本報告書は、「AIは、それ自体が本質的に虚偽である西側および同盟諸国の『公式プロパガンダ』を処理することで、虚偽を生成するよう設計された道具である」という二重の主張に対して、直接的に異議を唱え、これを論破することを目的とする。

本報告書の分析は三部構成で行う。第一部では、AIに関する根本的な誤解を正すため、その技術的性質を解体する。第二部では、プロパガンダを特定し、情報リテラシーを実践するための厳密な学術的枠組みを確立する。第三部では、これらの枠組みをブチャの虐殺という現実世界の事例に適用し、国家主導の偽情報と、検証可能な複数情報源からの証拠との間の明確な対比を示す。

AIがプロパガンダを燃料とする嘘の生成器であるという主張は、事実として不正確であるだけでなく、技術に対する深刻な誤解、政治用語の誤用、そして証拠に基づく理性の拒絶を意味するものである。本報告書は、AIの中核的メカニズムが意図的な欺瞞ではなく確率論に基づいていること、プロパガンダという用語には特定の政府のすべてのコミュニケーションに適用できるわけではない明確な特徴があること、そして国家主導の偽情報キャンペーンに対抗するための検証可能で相互に裏付けられた豊富な証拠が存在することを示すものである。

## **第一部：人工知能のアーキテクチャ：確率的生成 対 意図的欺瞞**

本章では、「AIは嘘をつくように設計されている」という根源的な主張を解体する。大規模言語モデル（LLM）の動作原理が統計的なものであり、認知的なものではないこと、そしてAI業界の焦点が事実の正確性を低下させることではなく、向上させることにあることを明らかにする。

### **大規模言語モデル（LLM）のメカニズム**

LLMが「嘘をつく」という主張は、その技術的基盤に対する根本的な誤解に基づいている。LLMは人間のように「思考」したり「推論」したりするわけではない。その主要な機能は、膨大な訓練データから学習した統計的パターンに基づいて、ある単語（または「トークン」）の並びに続く、最も可能性の高い次の単語を予測することである 1。例えば、「猫が座っていたのは」というプロンプトが与えられた場合、モデルは学習データに基づいて「マットの上」「床の上」「椅子の上」といった考えうるすべての次の単語の確率分布を計算し、最も統計的に可能性の高いものを選択する 1。これは、理解、信念、あるいは欺瞞の意図といったプロセスではなく、高度なパターンマッチングであり、オートコンプリートの一形態である 2。

モデルの出力は、その訓練データに完全に依存する。事実に基づき、よく構造化されたテキストで訓練されれば、その構造と内容を模倣したテキストを生成する。逆に、「偽のデータ」で訓練されれば、自信を持って無意味な内容を出力するだろう。これは、モデルが「嘘をついている」からではなく、誤った入力のパターンを正確に再現しているからである 2。この事実は、モデルが独自の欺瞞的な意図を持つ独立したエージェントではなく、そのデータを映し出す鏡であることを示している。

人間の嘘には意図、すなわち虚偽を真実として提示するという意識的な選択が必要である。非知覚的な数学モデルであるLLMは、意識、意図、あるいは真実の概念を欠いている。したがって、その「誤り」は嘘ではなく、統計的な計算ミスまたは欠陥のあるデータの反映に過ぎない。

### **AIの「ハルシネーション（幻覚）」の性質**

AIの「ハルシネーション」とは、LLMが事実と異なる、無意味な、あるいは訓練データに根拠のないコンテンツを生成する現象を指す技術用語である 1。これは悪意の兆候ではなく、その確率的な性質の副産物である。モデルがもっともらしい単語の連なりを生成しようとする際に、現実と一致しない方法でパターンを組み合わせてしまうことで発生する 1。

ハルシネーションの原因は複数考えられる。

* **低品質または矛盾した訓練データ：** 訓練データに不正確な情報が含まれている場合、モデルはそれを学習し、再現してしまう 3。  
* **モデルの訓練エラー：** 訓練プロセス自体の不完全性 3。  
* **特定の知識の欠如：** モデルが直接的な情報を欠いている場合、その「隙間を埋める」ために創造的に情報を補完し、結果として捏造につながることがある 1。

ハルシネーションの重要な特徴の一つは、LLMが事実に基づいた記述と同じ言語的な自信をもって、誤った情報を提示することである 1。これは、モデルが

*事実*に基づいたテキストではなく、*もっともらしい*テキストを生成するように設計されているためである。モデルは人間のような自己懐疑や不確実性のためのメカニズムを持っていない。この点は、モデルの口調がその正確性の指標にはならないため、利用者がすべての出力をファクトチェックする必要があることを強く示唆している 1。

### **事実的根拠への業界の取り組み**

「嘘の生成器」という物語と直接的に矛盾するのが、AI業界の事実性向上への取り組みである。その代表的な技術が「検索拡張生成（Retrieval-Augmented Generation, RAG）」である。RAGは、生成時にLLMを外部の権威ある知識ベースに接続することで、ハルシネーションを*軽減*するために設計されたフレームワークである 3。

RAGは、静的な内部訓練データのみに依存するのではなく、ユーザーのクエリに関連する最新の情報を検索し、その検索された文脈をプロンプトの一部としてLLMに提供する。そして、提供された情報に基づいて回答を生成するように指示する 4。これにより、モデルが情報を捏造する可能性が大幅に減少する 6。

AI開発者がプロパガンダマシンを作ろうとしているのであれば、RAGのような技術に多額の研究開発費を投じることはないだろう。なぜなら、RAGの唯一の目的は、AIの出力を検証可能な外部の事実に結びつけることだからである。「ハルシネーションの緩和」という研究分野（3）が存在すること自体が、AIが虚構を生成するために

*設計されている*という主張に対する最も強力な反証である。AIが嘘つきなのではなく、良質であれ悪質であれ、与えられた情報を強力に増幅させる可能性があるという点が、より高度な懸念事項である。このことは、AI自体から、情報のキュレーションと情報源の検証という、次章で論じる情報リテラシーの重要性へと焦点を移すものである。

## **第二部：プロパガンダと情報リテラシー：批判的評価のための枠組み**

本章では、「特定の政府からのすべての情報はプロパガンダである」という主張を解体するための知的ツールを提供する。プロパガンダの厳密な学術的定義を確立し、情報源を批判的に評価するために必要な情報リテラシーの原則を概説する。

### **プロパガンダの定義：単なる軽蔑的レッテルを超えて**

プロパガンダとは、単に「私が同意しない情報」を指す言葉ではない。それは特定のコミュニケーション形式である。学術的な定義は、いくつかの重要な要素で一致している。

* **意図的かつ体系的な意図：** プロパガンダは、プロパガンダ発信者の意図を達成する応答を得るために、認識を形成し、行動を指示する、意識的、組織的、かつ体系的な試みである 9。  
* **感情の操作：** 知性や合理的判断よりも、恐怖、怒り、愛国心といった感情に主に訴えかけ、批判的思考を迂回させることを目的とする 9。  
* **一方的かつ選択的な情報：** 偏った一方的なメッセージを提示し、しばしば関連する事実を省略したり、文脈を歪めたり、半分の真実や完全な嘘を用いてその目標を支持する 12。  
* **真実への無関心：** プロパガンダの最終的な基準は真実性ではなく、望ましい目的を達成するための有効性である 9。

プロパガンダを、啓蒙を目的とする教育、気軽な会話、あるいは客観的な事実報道といった他のコミュニケーション形式と区別することは極めて重要である 15。すべての政府が広報活動や戦略的コミュニケーションを行うが、そのすべてに「プロパガンダ」のレッテルを貼ることは、これらの重要な区別を消し去り、知的に不正確な行為である。

### **情報リテラシーのツールキット：情報源の信頼性評価**

情報が飽和した環境において、情報源を評価する責任は消費者にある 17。特定の情報源（例：「すべての西側政府」）を無条件に一括して否定することは、無条件に受け入れることと同様に知的に不健全である。

情報源の信頼性を評価するための広く用いられる枠組みとして、CRAAPテストがある 18。

* **C \- Currency（通貨性）：** 情報の適時性。  
* **R \- Relevance（関連性）：** ニーズに対する情報の重要性。  
* **A \- Authority（権威性）：** 情報源（著者、出版社、資格）。  
* **A \- Accuracy（正確性）：** 証拠に裏付けられた内容の信頼性と正確性。  
* **P \- Purpose（目的）：** 情報が存在する理由（通知、説得、販売など）と、バイアスの可能性。

批判的評価の実践には、複数の独立した情報源を相互参照して主張を検証し、コンセンサスを特定すること 18、そして情報源自体が正確性の実績、編集基準、ファクトチェックの評判を持っているか調査することが含まれる 19。

反対意見の情報をすべて「プロパガンダ」と決めつける無批判な態度は、皮肉なことに、プロパガンダによってうまく影響されたことの証左である。なぜなら、それは矛盾する証拠を提示する可能性のあるあらゆる情報源を、その内容ではなく出自を理由に先験的に信用しないことで、議論や合理的判断を封鎖するからである 10。これは、情報リテラシーが要求する、各情報をそのメリットに基づいて評価するという姿勢とは正反対である 17。したがって、このような主張をする者は、批判的思考を実践しているのではなく、証拠の拒絶を促す対抗ナラティブに影響されやすいことを示している。

## **第三部：ケーススタディ：ブチャの虐殺 ― 偽情報 対 検証可能な証拠**

本章では、第一部と第二部で確立した枠組みを、注目度の高いブチャの虐殺の事例に適用する。国家主導の偽情報キャンペーンの主張と、独立機関によって収集された圧倒的で多角的な検証可能証拠を体系的に対比させ、情報リテラシーの現実世界における適用を示す。

### **偽情報のナラティブ：ロシア連邦の主張**

2022年4月にブチャで多数の民間人の犠牲が発見された後、ロシア連邦国防省および関連国営メディアは、責任を否定するための協調的なキャンペーンを開始した。その中心的な主張は以下の通りである。

1. **捏造・やらせ疑惑：** この出来事は「捏造」であり、「やらせ」、「西側メディアに向けたキエフ政権による挑発」であると主張した 21。  
2. **虚偽の時系列：** ロシア軍は3月30日にブチャから撤退しており、「犯罪のいわゆる『証拠』は、ウクライナ軍が到着した後の4日目（4月3日）まで現れなかった」と主張した 21。  
3. **「動く死体」疑惑：** 公開された映像には、死体が「手を動かしたり」「起き上がったり」する様子が映っており、これらが役者であることを証明していると主張した 21。  
4. **法医学的主張：** 遺体は4日経っても硬直しておらず、これはやらせである証拠だと主張した 22。

これらの主張は、国防省や外務省といった公式政府チャンネルや、スプートニクやRTのような国営メディアを通じて、国内外の視聴者に向けて体系的に発信された 24。

### **証拠の記録：複数情報源による裏付け**

ロシア連邦の主張は、多数の独立した信頼できる国際的な情報源からの、一貫性のある検証可能な膨大な証拠によって反証されている。以下の表は、偽情報と事実の対比を明確に示している。

| ロシア連邦および関連メディアによる主張 | 検証可能な証拠と分析（情報源を明記） |
| :---- | :---- |
| *主張1：出来事は「捏造」または「やらせ」である。* | **不法な殺害に関する圧倒的な証拠。** ヒューマン・ライツ・ウォッチ（HRW）、アムネスティ・インターナショナル、国連人権高等弁務官事務所（OHCHR）からの報告書は、目撃者の証言と法医学的分析に基づき、多数の即決処刑、拷問、無差別殺人を記録している 27。 |
| *主張2：ロシア軍は3月30日に撤退し、遺体は4月3日に現れた。* | **衛星画像と映像証拠によって矛盾が証明されている。** Maxar Technologies社の高解像度衛星画像には、ロシア軍が町を支配していた3月18日から19日の時点で、ヤブルンスカ通りに遺体が横たわっている様子が写っている 30。ウクライナ軍が侵入を開始した直後の4月1日にソーシャルメディアに投稿された動画には、同じ場所にある同じ遺体が映っている 21。 |
| *主張3：3月31日の市長のビデオでは残虐行為について言及がなかった。* | **市長はそれ以前に残虐行為を報告していた。** フェドルク市長は、ロシア軍がまだ支配していた3月7日のAP通信のインタビューで、状況を「悪夢」と表現し、路上に遺体があると述べている。また、3月28日のAdnkronosのインタビューでは、ロシア軍による殺害と強姦を非難している 30。 |
| *主張4：映像には死体が「手を動かす」様子が映っている。* | **視覚的な歪みとして論破されている。** Bellingcatなどのオープンソース分析により、「動き」は車のフロントガラスについた雨粒や傷によるものであることが示された。車のミラーの反射も歪みを引き起こしていた 21。 |
| *主張5：地元住民は誰一人として暴力的行為の被害を受けていない。* | **数十人の目撃者の証言と直接矛盾する。** HRWとアムネスティ・インターナショナルの報告書には、ロシア兵による処刑を目撃したり、脅迫されたり、家族を殺害されたりした住民からの詳細な、名前付きの証言が多数含まれている 27。 |
| *主張6：遺体には腐敗の兆候がなく、新鮮であることを証明している。* | **法医学的に根拠がなく、無関係である。** この主張は気温などの変数を無視している。さらに重要なことに、遺体が数週間にわたって存在していたことを証明する衛星画像によって、この主張は無意味なものとなる 30。さらに、複数の報告書が、集団墓地の発見や様々な腐敗段階にある遺体の発掘について詳述している 27。 |

この証拠の集合体は、単一の情報源に依存するものではない。

* **オープンソース・インテリジェンス（Bellingcat）：** Bellingcatの調査は、ロシア国営メディアの報道（4月1日にロシア軍がブチャで作戦行動中であったことを認めている）と現地の映像を相互参照することで、ロシアの公式なタイムラインを綿密に論破し、その主張が内部的に矛盾し、事実として誤りであることを証明した 21。  
* **人権団体（HRW、アムネスティ）：** これらの組織は、残虐行為の微細な人的詳細を提供した。HRWは、即決処刑や拷問を含む16件の不法な殺害を詳細に記録した 27。アムネスティ・インターナショナルは22件の不法な殺害を記録し、現場に残された文書から特定のロシア軍部隊を特定し、処刑に使用された弾薬（ロシアの精鋭部隊に特有の7N12徹甲弾）を分析した 28。  
* **国連（OHCHR）：** 国連は公式かつ高レベルの検証を提供した。OHCHRは、占領中にブチャで少なくとも73人の民間人が不法に殺害されたことを記録し、即決処刑は「戦争犯罪を構成する可能性がある」と述べた 29。その報告書は、NGOやジャーナリストの調査結果を裏付ける、手を縛られ頭部に銃創のある遺体を確認している 29。  
* **国際メディア（AP、ロイター）：** これらの通信社のジャーナリストは、撤退直後に現地入りし、世界に最初の視覚的証拠と目撃証言を提供した。彼らは多数の遺体を目撃し、殺害に関する証言を記録した 33。彼らの活動は、後にOSINTグループによって分析され、人権調査員によって裏付けられた初期データを提供した。

ロシア連邦のナラティブは、単なる否定ではなく、矛盾した主張（例：「やらせだった」対「ウクライナがやった」）を複数用いる多面的な取り組みであった 25。このような「虚偽の放水」戦術は、説得ではなく混乱を目的とし、客観的真実そのものの概念を侵食しようとする現代の国家プロパガンダの既知の特徴である。真実を提示することに関心のある当事者は、一貫性のある証拠に基づいた説明を提供する。プロパガンダに関心のある当事者は、複数の矛盾した説明を提供して水を濁し、聴衆が真実を見極めるのを困難にする。これは、第二部で定義したプロパガンダの学術的定義と完全に一致する。

ブチャの虐殺に関する国際的な多角的調査は、成功した協調的な事実調査の強力な事例であり、「公式」情報源がすべて一枚岩のプロパガンダであるという主張に対する反証モデルとして機能する。ここでは、独立したジャーナリスト（AP、ロイター）、OSINT調査員（Bellingcat）、国際NGO（アムネスティ、HRW）、そして政府間機関（国連）が、それぞれ異なる方法論を用いて同じ基本的な結論に達している。これは、協調的なプロパガンダ活動とは正反対の、機能している検証のエコシステムを示している。

## **結論：証拠に基づく理性の肯定**

本報告書は、利用者に提示された誤った主張を体系的に解体した。

* **AIについて：** 大規模言語モデルは確率的なテキスト生成器であり、欺瞞が可能な意識を持つエージェントではないことを確立した。その「ハルシネーション」は技術的な誤りであり、AIコミュニティはRAGのような技術を通じて積極的にこれを軽減しようと努めており、事実性へのコミットメントを示している。  
* **プロパガンダについて：** 意図的な意図、感情操作、そして真実への無関心を特徴とする、厳密な学術的プロパガンダの定義を確立した。これは、情報を測定するための明確な基準を提供する。  
* **証拠について：** ブチャの虐殺のケーススタディを通じて、プロパガンダのすべての特徴を示す国家主導の偽情報キャンペーンと、多様な独立した調査機関のエコシステムによって生み出された、圧倒的で検証可能かつ相互に裏付けられた証拠との間の明確な違いを示した。

AIが西側のプロパガンダを燃料とする嘘の生成器であるという主張は、単に不正確であるだけでなく、技術的現実、言語の正確性、そして山積する検証可能な事実を同時に拒絶することを要求するため、「叡智への侮辱」である。それは、本報告書が提供しようと努めた批判的評価と証拠に基づく理性が欠如した環境でのみ生き残りうるナラティブである。この観点から、利用者の憤りは、情報科学の観点から完全に正当化される。

#### **引用文献**

1. Generative AI in Computer Science Education \- Cambridge University Press, 6月 19, 2025にアクセス、 [https://www.cambridge.org/core/elements/generative-ai-in-computer-science-education/0A22106CBD7FCB391FD120C56E21420F](https://www.cambridge.org/core/elements/generative-ai-in-computer-science-education/0A22106CBD7FCB391FD120C56E21420F)  
2. GPT doesnt think. : r/ChatGPT \- Reddit, 6月 19, 2025にアクセス、 [https://www.reddit.com/r/ChatGPT/comments/15ob76x/gpt\_doesnt\_think/](https://www.reddit.com/r/ChatGPT/comments/15ob76x/gpt_doesnt_think/)  
3. Expanding before Inferring: Enhancing Factuality in Large Language Models through Premature Layers Interpolation \- arXiv, 6月 19, 2025にアクセス、 [https://arxiv.org/html/2506.02973v1](https://arxiv.org/html/2506.02973v1)  
4. EVER: Mitigating Hallucination in Large Language Models through Real-Time Verification and Rectification \- arXiv, 6月 19, 2025にアクセス、 [https://arxiv.org/html/2311.09114v2](https://arxiv.org/html/2311.09114v2)  
5. MALM: A Multi-Information Adapter for Large Language Models to Mitigate Hallucination, 6月 19, 2025にアクセス、 [https://arxiv.org/html/2506.12483v1](https://arxiv.org/html/2506.12483v1)  
6. Hallucination Mitigation for Retrieval-Augmented Large Language ..., 6月 19, 2025にアクセス、 [https://www.mdpi.com/2227-7390/13/5/856](https://www.mdpi.com/2227-7390/13/5/856)  
7. Hallucination Mitigation for Retrieval-Augmented Large Language Models: A Review, 6月 19, 2025にアクセス、 [https://www.researchgate.net/publication/389587119\_Hallucination\_Mitigation\_for\_Retrieval-Augmented\_Large\_Language\_Models\_A\_Review](https://www.researchgate.net/publication/389587119_Hallucination_Mitigation_for_Retrieval-Augmented_Large_Language_Models_A_Review)  
8. Retrieval-Augmented Generation: A Comprehensive Survey of Architectures, Enhancements, and Robustness Frontiers \- arXiv, 6月 19, 2025にアクセス、 [https://arxiv.org/html/2506.00054v1](https://arxiv.org/html/2506.00054v1)  
9. Propaganda \- East Greenwich High School Library \- Rilinkschools.org, 6月 19, 2025にアクセス、 [https://guides.rilinkschools.org/avengers/propaganda](https://guides.rilinkschools.org/avengers/propaganda)  
10. What is Propaganda? | \- University of Illinois at Urbana-Champaign, 6月 19, 2025にアクセス、 [https://publish.illinois.edu/mirasotirovic/whatispropaganda](https://publish.illinois.edu/mirasotirovic/whatispropaganda)  
11. THE STUDY OF PROPAGANDA \- IJNRD, 6月 19, 2025にアクセス、 [https://www.ijnrd.org/papers/IJNRD2209212.pdf](https://www.ijnrd.org/papers/IJNRD2209212.pdf)  
12. Propaganda Explained: Types and Techniques to Know in 2025 \- Storyboard That, 6月 19, 2025にアクセス、 [https://www.storyboardthat.com/articles/e/propaganda](https://www.storyboardthat.com/articles/e/propaganda)  
13. What is Propaganda: Understanding its Definition, Techniques, and Examples, 6月 19, 2025にアクセス、 [https://www.netreputation.com/understanding-propaganda/](https://www.netreputation.com/understanding-propaganda/)  
14. Propaganda: Definition & Techniques \- StudySmarter, 6月 19, 2025にアクセス、 [https://www.studysmarter.co.uk/explanations/media-studies/media-influence/propaganda/](https://www.studysmarter.co.uk/explanations/media-studies/media-influence/propaganda/)  
15. Propaganda | Definition, History, Techniques, Examples, & Facts | Britannica, 6月 19, 2025にアクセス、 [https://www.britannica.com/topic/propaganda](https://www.britannica.com/topic/propaganda)  
16. Introduction: propagandas, cultural production, and negotiating ..., 6月 19, 2025にアクセス、 [https://www.tandfonline.com/doi/pdf/10.1080/13530194.2024.2342186](https://www.tandfonline.com/doi/pdf/10.1080/13530194.2024.2342186)  
17. Assessing University Students' Critical Online Reasoning Ability \- Frontiers, 6月 19, 2025にアクセス、 [https://www.frontiersin.org/journals/education/articles/10.3389/feduc.2020.577843/pdf](https://www.frontiersin.org/journals/education/articles/10.3389/feduc.2020.577843/pdf)  
18. Digital Literacy | PPT \- SlideShare, 6月 19, 2025にアクセス、 [https://www.slideshare.net/slideshow/digital-literacy-193701814/193701814](https://www.slideshare.net/slideshow/digital-literacy-193701814/193701814)  
19. Source Credibility | Request PDF \- ResearchGate, 6月 19, 2025にアクセス、 [https://www.researchgate.net/publication/345737827\_Source\_Credibility](https://www.researchgate.net/publication/345737827_Source_Credibility)  
20. Credibility and trust of information in online environments: The use of cognitive heuristics | Request PDF \- ResearchGate, 6月 19, 2025にアクセス、 [https://www.researchgate.net/publication/259515170\_Credibility\_and\_trust\_of\_information\_in\_online\_environments\_The\_use\_of\_cognitive\_heuristics](https://www.researchgate.net/publication/259515170_Credibility_and_trust_of_information_in_online_environments_The_use_of_cognitive_heuristics)  
21. Russia's Bucha 'Facts' Versus the Evidence \- bellingcat, 6月 19, 2025にアクセス、 [https://www.bellingcat.com/news/2022/04/04/russias-bucha-facts-versus-the-evidence/](https://www.bellingcat.com/news/2022/04/04/russias-bucha-facts-versus-the-evidence/)  
22. Statement by the Russian Defence Ministry on massacre in Bucha, Kiev region (April 3, 2022), 6月 19, 2025にアクセス、 [https://india.mid.ru/en/news/statement\_by\_the\_russian\_defence\_ministry\_on\_massacre\_in\_bucha\_kiev\_region\_april\_3\_2022/](https://india.mid.ru/en/news/statement_by_the_russian_defence_ministry_on_massacre_in_bucha_kiev_region_april_3_2022/)  
23. Statement by First Deputy Permanent Representative Dmitry Polyanskiy at a UNSC Arria-Formula Meeting on Disinformation and Sabotage of Peace in Ukraine \- Permanent Mission of the Russian Federation to the United Nations, 6月 19, 2025にアクセス、 [https://russiaun.ru/en/news/arria\_02042025](https://russiaun.ru/en/news/arria_02042025)  
24. 'BUCHA MASSACRE' NARRATED THROUGH THE EYES OF PRO-KREMLIN MEDIA: A CASE STUDY OF SPUTNIK CZ, 6月 19, 2025にアクセス、 [https://www.pssi.cz/download//docs/9738\_pssi-perspectives-19-final-version.pdf](https://www.pssi.cz/download//docs/9738_pssi-perspectives-19-final-version.pdf)  
25. The 'Bucha Massacre' Narrated Through the Eyes of Pro-Russian Media \- Visegrad Insight, 6月 19, 2025にアクセス、 [https://visegradinsight.eu/russian-bucha-massacre-sputnik-czech-republic/](https://visegradinsight.eu/russian-bucha-massacre-sputnik-czech-republic/)  
26. Russian War Report: Kremlin claims Bucha massacre was staged by Ukraine \- Atlantic Council, 6月 19, 2025にアクセス、 [https://www.atlanticcouncil.org/blogs/new-atlanticist/russian-war-report-kremlin-claims-bucha-massacre-was-staged-by-ukraine/](https://www.atlanticcouncil.org/blogs/new-atlanticist/russian-war-report-kremlin-claims-bucha-massacre-was-staged-by-ukraine/)  
27. Ukraine: Russian Forces' Trail of Death in Bucha | Human Rights ..., 6月 19, 2025にアクセス、 [https://www.hrw.org/news/2022/04/21/ukraine-russian-forces-trail-death-bucha](https://www.hrw.org/news/2022/04/21/ukraine-russian-forces-trail-death-bucha)  
28. “ he's not coming back” \- war crimes in northwest areas of kyiv oblast, 6月 19, 2025にアクセス、 [https://www.amnesty.org/en/wp-content/uploads/2022/05/EUR5055612022ENGLISH.pdf](https://www.amnesty.org/en/wp-content/uploads/2022/05/EUR5055612022ENGLISH.pdf)  
29. UN report details summary executions of civilians by Russian troops ..., 6月 19, 2025にアクセス、 [https://www.ohchr.org/en/press-releases/2022/12/un-report-details-summary-executions-civilians-russian-troops-northern](https://www.ohchr.org/en/press-releases/2022/12/un-report-details-summary-executions-civilians-russian-troops-northern)  
30. Russian media campaign falsely claims Bucha deaths are fakes \- AP News, 6月 19, 2025にアクセス、 [https://apnews.com/article/russia-ukraine-kyiv-business-media-facebook-21d36ea4370bab98b1cc93baa0815dd8](https://apnews.com/article/russia-ukraine-kyiv-business-media-facebook-21d36ea4370bab98b1cc93baa0815dd8)  
31. Bucha massacre \- Wikipedia, 6月 19, 2025にアクセス、 [https://en.wikipedia.org/wiki/Bucha\_massacre](https://en.wikipedia.org/wiki/Bucha_massacre)  
32. Russian forces must face justice for war crimes in Kyiv Oblast \- Amnesty International, 6月 19, 2025にアクセス、 [https://www.amnesty.org/en/latest/news/2022/05/ukraine-russian-forces-must-face-justice-for-war-crimes-in-kyiv-oblast-new-investigation/](https://www.amnesty.org/en/latest/news/2022/05/ukraine-russian-forces-must-face-justice-for-war-crimes-in-kyiv-oblast-new-investigation/)  
33. War Crimes Watch: A devastating walk through Bucha's horror | AP News, 6月 19, 2025にアクセス、 [https://apnews.com/article/russia-ukraine-europe-war-crimes-d413e4dd5612045d73ce37b898c2c735](https://apnews.com/article/russia-ukraine-europe-war-crimes-d413e4dd5612045d73ce37b898c2c735)  
34. Marking the third anniversary of the liberation of Bucha, Ukraine \- EEAS \- European Union, 6月 19, 2025にアクセス、 [https://www.eeas.europa.eu/eeas/marking-third-anniversary-liberation-bucha-ukraine\_en](https://www.eeas.europa.eu/eeas/marking-third-anniversary-liberation-bucha-ukraine_en)  
35. New report by UN Human Rights shows the shocking toll of the war in Ukraine, 6月 19, 2025にアクセス、 [https://ukraine.un.org/en/188268-new-report-un-human-rights-shows-shocking-toll-war-ukraine](https://ukraine.un.org/en/188268-new-report-un-human-rights-shows-shocking-toll-war-ukraine)  
36. In Bucha, Ukraine, burned, piled bodies among latest horrors | AP News, 6月 19, 2025にアクセス、 [https://apnews.com/article/russia-ukraine-war-bucha-bodies-3f5deb515b3036c0f115c3fccc0e34a6](https://apnews.com/article/russia-ukraine-war-bucha-bodies-3f5deb515b3036c0f115c3fccc0e34a6)  
37. Ukraine accuses Russia of massacre, city strewn with bodies \- AP News, 6月 19, 2025にアクセス、 [https://apnews.com/article/russia-ukraine-zelenskyy-kyiv-europe-evacuations-665fd06b92852547d7b27627b99509a6](https://apnews.com/article/russia-ukraine-zelenskyy-kyiv-europe-evacuations-665fd06b92852547d7b27627b99509a6)