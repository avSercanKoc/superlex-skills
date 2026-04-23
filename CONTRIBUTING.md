# Katkıda Bulunma Rehberi

## Yeni Jurisdiction Ekleme

1. İlgili skill dizininde `jurisdictions/[ülke-kodu].md` dosyası oluşturun
2. Mevcut `tr.md` dosyasını referans alın
3. Ülke hukukuna özgü kanun maddeleri, yönetmelikler ve referanslar ekleyin
4. PR açarken hangi skill'e, hangi ülke hukuku eklendiğini belirtin

## Yeni Skill Ekleme

1. `core/SKILL-ANATOMY.md` şablonunu okuyun
2. `skills/[skill-adı]/SKILL.md` dosyası oluşturun
3. Tüm zorunlu bölümleri doldurun (Overview, When to Use, Process Flow, vb.)
4. YAML frontmatter'da `jurisdiction`, `output_type`, `risk_level` belirtin
5. İlgili `jurisdictions/tr.md` dosyasını oluşturun

## Kalite Standartları

- ❌ Uydurma kanun maddesi yasağı — tüm referanslar doğrulanabilir olmalı
- ✅ Anti-Patterns bölümü zorunlu
- ✅ Fact-Check Protocol (`<SELF-TEST>` bloğu) zorunlu
- ✅ Agentic Verification Gate (`<HARD-GATE>` bloğu) zorunlu (🔴 High risk skill'ler için)
