package main

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"sort"
)

// TextFragment represents a single piece of text data
type TextFragment struct {
	ID     string
	Hash   string
	Size   int
	Seq    int
	Data   string
}

// VoVPost contains reconstructed data
type VoVPost struct {
	PostID    string
	VovID     string
	Nickname  string
	Timestamp string
	Text      string
	Verified  bool
	IntentFlags []string
}

// Dummy signature verifier (placeholder)
func verifySignature(post VoVPost, expectedHash string) bool {
	// Concatenate and hash the text
	h := sha256.Sum256([]byte(post.Text))
	return hex.EncodeToString(h[:]) == expectedHash
}

// ReassembleText rebuilds original text from fragments
func ReassembleText(fragments []TextFragment, expectedHashes []string) (string, bool) {
	if len(fragments) != len(expectedHashes) {
		return "", false
	}

	sort.Slice(fragments, func(i, j int) bool {
		return fragments[i].Seq < fragments[j].Seq
	})

	rebuilt := ""
	for i, frag := range fragments {
		h := sha256.Sum256([]byte(frag.Data))
		if hex.EncodeToString(h[:]) != expectedHashes[i] {
			return "", false
		}
		rebuilt += frag.Data
	}
	return rebuilt, true
}

func main() {
	// Mock fragments
	fragments := []TextFragment{
		{ID: "frag-01", Seq: 1, Data: "Hello ", Hash: ""},
		{ID: "frag-02", Seq: 2, Data: "world!", Hash: ""},
	}

	// Generate and assign correct hashes (simulating trusted source)
	expectedHashes := make([]string, len(fragments))
	for i, frag := range fragments {
		h := sha256.Sum256([]byte(frag.Data))
		fragments[i].Hash = hex.EncodeToString(h[:])
		expectedHashes[i] = fragments[i].Hash
	}

	text, ok := ReassembleText(fragments, expectedHashes)
	if !ok {
		fmt.Println("❌ 断片検証に失敗しました")
		return
	}

	post := VoVPost{
		PostID:     "1234-5678",
		VovID:      "VoV-ABCD",
		Nickname:   "tester",
		Timestamp:  "2025-06-07T05:00:00Z",
		Text:       text,
		IntentFlags: []string{"no-AI-training"},
	}

	// Dummy expected signature (hash of full text)
	expectedSig := hex.EncodeToString(sha256.Sum256([]byte(text))[:])

	if verifySignature(post, expectedSig) {
		fmt.Println("✅ 投稿復元と署名検証に成功しました：")
		fmt.Println(post.Text)
	} else {
		fmt.Println("⚠️ 署名検証に失敗しました")
	}
}
