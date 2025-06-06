package main

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"io/ioutil"
	"os"
	"time"
)

// Fragment structure for transmission
type Fragment struct {
	ID       string
	Seq      int
	Hash     string
	Data     []byte
	Status   string
}

// VoVDaemon handles post monitoring and distribution
func VoVDaemon(postPath string, fragmentSize int) {
	data, err := ioutil.ReadFile(postPath)
	if err != nil {
		fmt.Println("❌ 投稿データ読み込み失敗:", err)
		return
	}

	totalLen := len(data)
	totalFragments := (totalLen + fragmentSize - 1) / fragmentSize
	fmt.Printf("📦 投稿を %d フラグメントに分割中...\n", totalFragments)

	fragments := make([]Fragment, 0, totalFragments)
	for i := 0; i < totalFragments; i++ {
		start := i * fragmentSize
		end := start + fragmentSize
		if end > totalLen {
			end = totalLen
		}
		fragData := data[start:end]
		hash := sha256.Sum256(fragData)
		fragments = append(fragments, Fragment{
			ID:     fmt.Sprintf("frag-%03d", i+1),
			Seq:    i,
			Hash:   hex.EncodeToString(hash[:]),
			Data:   fragData,
			Status: "ready",
		})
	}

	for _, frag := range fragments {
		go func(f Fragment) {
			// ⚙️ 非同期送信処理の模擬（ネット越しのピアに送る）
			fmt.Printf("🚀 送信中: %s (%d bytes)\n", f.ID, len(f.Data))
			time.Sleep(100 * time.Millisecond) // 疑似送信遅延
			fmt.Printf("✅ 送信完了: %s\n", f.ID)
		}(frag)
	}

	// 復旧・監視・保持
	fmt.Println("🔁 VoVデーモン：監視モード開始")
	for {
		// TODO: fragment 再要求 / timeout / redundancy check など
		time.Sleep(30 * time.Second)
		fmt.Println("🌀 断片の状態確認... (mock check)")
	}
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: vovdaemon <path_to_post>")
		return
	}

	path := os.Args[1]
	VoVDaemon(path, 1024) // 1KB単位で分割
}
