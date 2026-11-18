package lang

import "strings"

// PickAppI18n 从 App/CMS 下发的多语言字段中按语言取文案; 目标语言为空时回落英文.
func PickAppI18n(l Lang, en, es, pt, hi, id, ar string) string {
	var s string
	switch l {
	case LangES:
		s = es
	case LangPT:
		s = pt
	case LangHI:
		s = hi
	case LangID:
		s = id
	case LangAR:
		s = ar
	default:
		s = en
	}
	s = strings.TrimSpace(s)
	if s != "" {
		return s
	}
	return strings.TrimSpace(en)
}