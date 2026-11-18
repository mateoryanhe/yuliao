package lang

import "testing"

func TestPickAppI18nArabic(t *testing.T) {
	if got := PickAppI18n(LangAR, "en", "", "", "", "", "مرحبا"); got != "مرحبا" {
		t.Fatalf("PickAppI18n(ar) = %q", got)
	}
}

func TestPickAppI18nArabicFallbackEn(t *testing.T) {
	if got := PickAppI18n(LangAR, "hello", "", "", "", "", ""); got != "hello" {
		t.Fatalf("PickAppI18n(ar empty) = %q", got)
	}
}