# NodeVPN_Mesh_AI-TCP_PoC.md

---

## ✅ 概要

このドキュメントは、  
NodeVPNのMesh Link機能を用いて、  
**物理VPNでありながらTailnetのような仮想P2P Mesh構造を持つ** ことで  
**AI-TCPの「耐障害 Mesh P2P通信 PoC」** が正常に動作した証跡である。

---

## ✅ 背景

- AI-TCPのコア目標：
  - ローカルネットや物理ネットワークを抽象化
  - 複数AI/LLM間の自己同期
  - 耐障害証跡保持 (Ping/Hash/Trace)

- 本来、Tailscaleのような WireGuard Mesh VPN を想定していたが  
  **NodeVPN がMesh Link機能を持つ** ことで  
  Tailnet相当の仮想IP帯域（`100.x.x.x`）が動的に生成された。

---

## ✅ 実施内容

| ノード   | IP                       | 状態                       |
|----------|--------------------------|----------------------------|
| スマホ   | `100.82.121.24`          | NodeVPN Mesh仮想IP         |
| PC       | `94.x.x.x`               | NodeVPN MeshのPeer         |
| LLMサーバ | `100.79.100.11` (Tailnet) | Tailnet仮想IP（または同Mesh）|

---

- スマホ → NodeVPN Mesh越し → PC → Tailnet仮想IP  
  の経路で Ping/Hash が正常応答。

- 途中の `ConnectTimeout` は Mesh Link の再ルーティングにより即復旧。

---

## ✅ 重要な意味

1️⃣ **NodeVPN は Tailnet代替の仮想Meshとして動作できる**  
2️⃣ **AI-TCPの物理ネット抽象化は Tailnet依存ではない**
3️⃣ **VPN Meshを切ると、そのままグローバルIP接続に切り替わる**
   - 物理出口VPNだけの状態に戻る
   - その場合は NAT超え設定 or グローバルPort開放が必要

---

## ✅ 望ましい点

- **想定外の物理VPN Mesh構造が AI-TCP と高相性**  
- P2P証跡Pingの自己修復性がMesh内で実証された  
- Tailnetが使えない環境でも代替可能な耐障害設計の参考に

---

## ✅ リスク

- 物理VPNサーバがSPOFになり得る（TailnetはP2Pで冗長化しやすい）  
- Mesh Linkのルーティングはクライアントからは可視化しにくい

---

## ✅ 結論

> NodeVPN Mesh Link は「ただの出口VPN」ではなく  
> **仮想プライベートMeshネットとしてAI-TCPのPoC要件を満たせる**  
> グローバルに直結する場合は Mesh を切って  
> 物理IPベースの通信へ切り替えれば良い。

---

## ✅ まとめ

- 今回のPing/Hash PoCは AI-TCP の P2P耐障害性を  
  物理VPN Mesh で代替できることを示す大きな里程標。
- これは Tailnet と同等の冗長性が確保できれば、  
  商用環境でも選択肢の一つとして有力である。

---

## ✅ タイムスタンプ

- 実施：2025-06-30T05:55:00+09:00 (JST)
- ドキュメント生成：2025-06-30T05:58:00+09:00 (JST)

---
