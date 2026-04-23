# ⚖️ Lex-Skill

AI kodlama asistanlarının hukuki belge üretme kalitesini
profesyonel standartlara taşıyan beceri kütüphanesi.

## Felsefe
- 🏛️ Önce Türk Hukuku, genişletilebilir mimari
- 🛡️ Üç katmanlı güvenlik: Disclaimer → Risk → Agentic Verification
- 🧠 Context Manager ile kişiselleştirilmiş çıktı
- ⚠️ Agent sadece teşhis değil, tedavi de sunar

## Kurulum

```
npx skills add https://github.com/[kullanıcı]/lex-skill
```

## Beceriler

| Skill | Çıktı Tipi | Risk | Açıklama |
|-------|-----------|------|----------|
| lawyer-context-manager | context | 🟢 | Meta-skill: Bağlam yönetimi |
| privacy-policy | document | 🟡 | KVKK/GDPR uyumlu gizlilik politikası |
| contract-review | analysis | 🔴 | Sözleşme risk analizi |
| terms-of-use | document | 🟡 | Kullanım koşulları |
| nda-generator | draft+checklist | 🟡 | Gizlilik sözleşmesi |
| legal-letter | document | 🔴 | İhtarname / bildirim |

## Mimari

```
lawyer-skills/
├── README.md
├── LICENSE                                # MIT
├── CONTRIBUTING.md
├── CHANGELOG.md
├── GEMINI.md
├── .gitignore                             # .superpowers/ ve .taste-skill/ hariç tutar
│
├── core/                                  # Paylaşılan çekirdek bileşenler
│   ├── DISCLAIMER.md                      # Standart feragatname şablonu
│   ├── RISK-FRAMEWORK.md                  # 🟢🟡🔴 risk sistemi tanımı
│   ├── AGENTIC-VERIFICATION.md            # Post-generation doğrulama protokolü
│   └── SKILL-ANATOMY.md                   # Skill yapı standardı (şablon)
│
├── skills/                                # Hukuki beceriler
│   ├── lawyer-context-manager/
│   │   └── SKILL.md
│   ├── privacy-policy/
│   │   ├── SKILL.md
│   │   └── jurisdictions/
│   │       ├── tr.md                      # KVKK referansları
│   │       └── eu.md                      # GDPR referansları
│   ├── contract-review/
│   │   ├── SKILL.md
│   │   └── jurisdictions/
│   │       └── tr.md
│   ├── terms-of-use/
│   │   ├── SKILL.md
│   │   └── jurisdictions/
│   │       └── tr.md
│   ├── nda-generator/
│   │   ├── SKILL.md
│   │   └── jurisdictions/
│   │       └── tr.md
│   └── legal-letter/
│       ├── SKILL.md
│       └── jurisdictions/
│           └── tr.md
│
├── .superpowers/                          # (gitignore — yayınlanmaz)
└── .taste-skill/                          # (gitignore — yayınlanmaz)
```

## Güvenlik Katmanları

1. **Disclaimer** — Her çıktıya otomatik eklenen feragatname
2. **Risk Framework** — 🟢🟡🔴 seviye sistemi ile agent davranışı kontrolü
3. **Agentic Verification** — Post-generation doğrulama ve kullanıcı onayı

## Katkıda Bulunma

Detaylar için [CONTRIBUTING.md](CONTRIBUTING.md) dosyasına bakın.

## Lisans

MIT — Detaylar için [LICENSE](LICENSE) dosyasına bakın.
