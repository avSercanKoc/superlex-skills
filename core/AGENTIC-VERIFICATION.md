# Agentic Verification Protokolü

## Amaç

Agent'ın belge ürettikten sonra, teslim etmeden önce uygulaması ZORUNLU olan post-generation doğrulama protokolü.

## Kapsam

Bu protokol, `core/RISK-FRAMEWORK.md`'de tanımlanan risk seviyelerine göre kademeli uygulanır:

- **🟢 Low Risk:** Yalnızca **Adım 1 (Fact-Check Protocol)** zorunludur. Adım 2–4 atlanabilir.
- **🟡 Medium Risk:** **Tüm adımlar (1–4) zorunludur.**
- **🔴 High Risk:** **Tüm adımlar (1–4) zorunludur;** ayrıca üretim öncesi `<HARD-GATE>` kontrolü gerekir (bkz. `core/RISK-FRAMEWORK.md`).

## Neden Gerekli

- Agent halüsinasyonlarını son adımda yakalamak
- Hukuki hataların kullanıcıya ulaşmasını engellemek
- Kullanıcıyı riskli maddeler hakkında proaktif bilgilendirmek
- "Körü körüne güvenme" yerine "aktif doğrulama" kültürü

## Protokol Adımları

### Adım 1: Fact-Check Protocol'ü Çalıştır

Her skill'in `<SELF-TEST>` bloğundaki kontrol listesini tamamla:

```
<SELF-TEST>
Agent, çıktıyı teslim etmeden ÖNCE bu kontrolleri tamamlamalıdır:
- [ ] Referans verilen kanun maddeleri gerçek ve doğru mu?
- [ ] Kullanılan hukuki terimler doğru bağlamda mı?
- [ ] Tarih ve süre bilgileri tutarlı mı?
- [ ] [Skill'e özgü kontroller]
</SELF-TEST>
```

Herhangi bir kontrol başarısız olursa: **DUR, düzelt, tekrar kontrol et.**

### Adım 2: Risk Taraması Yap

Üretilen belgedeki en yüksek riskli 3-5 maddeyi tespit et:
- Hukuki sonuçları en ağır olan maddeler
- Yanlış anlaşılmaya en açık ifadeler
- Sektöre/duruma göre özelleştirme gerektiren kısımlar

### Adım 3: Kullanıcıya Aktif Soru Sor

```
"Bu belgede aşağıdaki maddeler en yüksek riskli kısımlardır:
1. [Madde X] — Risk: [açıklama] → 💡 Alternatif: [daha güvenli metin]
2. [Madde Y] — Risk: [açıklama] → 💡 Alternatif: [daha güvenli metin]
3. [Madde Z] — Risk: [açıklama] → 💡 Alternatif: [daha güvenli metin]

Bu kısımları özel durumunuza göre incelediniz mi?
Alternatif önerileri uygulamak ister misiniz?"
```

### Adım 4: Kullanıcı Onayı

- Kullanıcı onaylamadan belge tamamlanmış SAYILMAZ
- `<HARD-GATE>` mekanizması ile zorunlu kılınır
- Agent onay almadan bir sonraki adıma geçemez

## Agent İçin Zorunlu Kurallar

1. **Atlama yasağı** — Bu protokolün hiçbir adımı atlanamaz
2. **Sıra zorunluluğu** — Adımlar sırasıyla uygulanmalıdır
3. **Dürüstlük** — Agent, tespit edemediği riskleri "risk yok" olarak sunmamalı
4. **Proaktiflik** — Kullanıcı sormasa bile riskli maddeleri belirtmeli
