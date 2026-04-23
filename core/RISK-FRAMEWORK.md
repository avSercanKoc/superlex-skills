# Risk Seviyesi Çerçevesi (Risk Framework)

## Amaç

Lex-Skill'deki her becerinin risk seviyesini tanımlar ve agent'ın her seviyede nasıl davranması gerektiğini belirler.

## Risk Seviyeleri

### 🟢 Low Risk

**Agent Davranışı:** Özgür hareket eder, bilgilendirme yapar ama durmaz.

**Karakteristikler:**
- Belge hukuki bağlayıcılık taşımaz
- Hatalı üretim doğrudan hak kaybına yol açmaz
- Genel bilgilendirme niteliğindedir

**Örnek Skill'ler:** cookie-policy

**Agent Talimatı:**
1. Context bilgilerini kontrol et
2. Belgeyi üret
3. Fact-Check Protocol'ü çalıştır
4. Disclaimer ekle
5. Teslim et

---

### 🟡 Medium Risk

**Agent Davranışı:** Her kritik noktada açıklama ve alternatif sunar.

**Karakteristikler:**
- Belge hukuki sonuçlar doğurabilir
- Hatalı üretim düzeltilebilir ama maliyetli olabilir
- Sektöre/duruma özgü özelleştirme kritik

**Örnek Skill'ler:** privacy-policy, nda-generator, terms-of-use

**Agent Talimatı:**
1. Context bilgilerini kontrol et (eksikse `lawyer-context-manager`'ı tetikle)
2. Belgeyi üret
3. Kritik noktalarda açıklama ve alternatif sun
4. Fact-Check Protocol'ü çalıştır
5. Agentic Verification — risk taraması yap, kullanıcıya sun
6. Kullanıcı onayı al
7. Disclaimer ekle
8. Teslim et

---

### 🔴 High Risk

**Agent Davranışı:** HARD-GATE — durur, zorunlu bilgileri sorar, onay almadan devam etmez.

**Karakteristikler:**
- Belge doğrudan hukuki süreç başlatabilir
- Yasal süreleri tetikleyebilir
- Mahkemede delil olarak kullanılabilir
- Hatalı üretim geri dönüşü zor veya imkansız hak kayıplarına yol açabilir

**Örnek Skill'ler:** legal-letter, contract-review

**Agent Talimatı:**
1. Context bilgilerini kontrol et (eksikse `lawyer-context-manager`'ı tetikle)
2. **<HARD-GATE>** — Belge üretmeden ÖNCE zorunlu soruları sor
3. Tüm zorunlu bilgileri al; eksik bilgi varsa DUR — devam etme
4. Kullanıcı tüm soruları yanıtladıktan sonra belgeyi üret
5. Fact-Check Protocol'ü çalıştır
6. Agentic Verification — risk taraması yap, en yüksek riskli maddeleri sun
7. Kullanıcı onayı al
8. Disclaimer ekle
9. Teslim et

## Skill'lerde Risk Seviyesi Belirleme

YAML frontmatter'daki `risk_level` alanı bu çerçeveye göre belirlenir:

```yaml
risk_level: "low"    # 🟢
risk_level: "medium" # 🟡
risk_level: "high"   # 🔴
```

## Genel Güvenlik Akışı

```
Agent skill'i okur
       ↓
[🔴 High Risk ise] → HARD-GATE: Zorunlu bilgileri sor → Onay al
       ↓
Belgeyi üret
       ↓
Fact-Check Protocol (<SELF-TEST> bloğu)
       ↓
Agentic Verification (kullanıcıya risk + alternatif sun)
       ↓
Kullanıcı onaylar → Disclaimer eklenir → Teslim
```
