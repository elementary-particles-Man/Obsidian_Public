# Project KIKAI：構造分析図解

## 1. TSOM構造フローチャート

この図は、TSOMテンプレートがどのように機能するか、すなわち「誰が」「何を使って」「どの資源をどこからどこへ流したか」という、権限・資金・責任の非対称な流れを定義したものです。

```mermaid
graph TD
    subgraph Project_KIKAI [Project KIKAI: 国家構造に組み込まれた自動利権装置]
        direction LR;
        subgraph Prototype_Development [プロトタイプの開発と洗練]
            direction TB;
            Fukko["東日本大震災復興<br>(危機駆動モデル)"];
            Kuko["空港再開発<br>(制度的支配モデル)"];
        end;

        subgraph Integrated_Model [完成形モデルの実装]
            direction TB;
            Tokyo2020["東京2020五輪<br>(完全統合モデル)<br>TSOMテンプレートの完成 ※"];
        end;

        subgraph Field_Test [特定地域での戦術的リハーサル]
            direction TB;
            G20["G20大阪サミット<br>(戦術的リハーサル)"];
        end;

        subgraph Current_Manifestation [最新の顕在化事例]
            direction TB;
            Expo2025["大阪・関西万博<br>(盾を失い、構造が露出) ※"];
        end;

        Prototype_Development -->|"学習と統合<br>Learning & Integration"| Integrated_Model;
        Integrated_Model -->|"テンプレートの適用<br>Template Application"| Field_Test;
        Field_Test -->|"経験の継承<br>Experience Inheritance"| Current_Manifestation;
    end;

```

## 2. TSOMプロトタイプ比較マトリクス

この図は、過去の各国家プロジェクトが、TSOMの5つの要素をどの程度満たしていたかをスコアリングし、視覚的に比較するものです。

```mermaid
graph TD
    subgraph "TSOM要素 (TSOM Elements)"
        E1[政治的中核<br>Political Core];
        E2[不透明な資金フロー<br>Opaque Funding];
        E3[構造的な責任回避<br>Structural Avoidance];
        E4[固定化された受益者<br>Fixed Beneficiaries];
        E5[世論との乖離<br>Public Disconnect];
    end

    subgraph "ケーススタディ (Case Studies)"
        P1["<b>東京2020五輪</b><br>スコア: 4.8/5<br>類型: 完全統合モデル"];
        P2["<b>東日本大震災復興</b><br>スコア: 3.4/5<br>類型: 危機駆動モデル"];
        P3["<b>空港再開発</b><br>スコア: 3.8/5<br>類型: 制度的支配モデル"];
        P4["<b>G20大阪サミット</b><br>スコア: 2.2/5<br>類型: 戦術的リハーサル"];
    end

    %% スコアリングリンク
    P1 -->|"4/5"| E1;
    P1 -->|"5/5"| E2;
    P1 -->|"5/5"| E3;
    P1 -->|"5/5"| E4;
    P1 -->|"5/5"| E5;

    P2 -->|"3/5"| E1;
    P2 -->|"4/5"| E2;
    P2 -->|"4/5"| E3;
    P2 -->|"5/5"| E4;
    P2 -->|"1/5"| E5;

    P3 -->|"5/5"| E1;
    P3 -->|"3/5"| E2;
    P3 -->|"4/5"| E3;
    P3 -->|"4/5"| E4;
    P3 -->|"3/5"| E5;

    P4 -->|"2/5"| E1;
    P4 -->|"3/5"| E2;
    P4 -->|"2/5"| E3;
    P4 -->|"3/5"| E4;
    P4 -->|"1/5"| E5;

    %% スタイル設定
    style P1 fill:#ffcccc;
    style P2 fill:#fff5cc;
    style P3 fill:#e5ccff;
    style P4 fill:#cce5ff;
```

## 3. Project KIKAI 構造系譜図

この図は、各事例が「Project KIKAI」という巨大な構造の中で、どのように連携し、進化の系譜を形成しているかを示したものです。

```mermaid
graph TD
    subgraph Project_KIKAI [Project KIKAI: 国家構造に組み込まれた自動利権装置]
        direction LR;
        subgraph Prototype_Development [プロトタイプの開発と洗練]
            direction TB;
            Fukko["東日本大震災復興<br>(危機駆動モデル)"];
            Kuko["空港再開発<br>(制度的支配モデル)"];
        end;

        subgraph Integrated_Model [完成形モデルの実装]
            direction TB;
            Tokyo2020["東京2020五輪<br>(完全統合モデル)<br><b>TSOMテンプレートの完成</b>"];
        end;

        subgraph Field_Test [特定地域での戦術的リハーサル]
            direction TB;
            G20["G20大阪サミット<br>(戦術的リハーサル)"];
        end;

        subgraph Current_Manifestation [最新の顕在化事例]
            direction TB;
            Expo2025["大阪・関西万博<br>(<b>盾を失い、構造が露出</b>)"];
        end;

        Prototype_Development -->|"学習と統合<br>Learning & Integration"| Integrated_Model;
        Integrated_Model -->|"テンプレートの適用<br>Template Application"| Field_Test;
        Field_Test -->|"経験の継承<br>Experience Inheritance"| Current_Manifestation;
    end;
```