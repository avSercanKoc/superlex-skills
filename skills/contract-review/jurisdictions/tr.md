# Türkiye — Sözleşme İnceleme Referansları

## Temel Mevzuat

- **6098 sayılı Türk Borçlar Kanunu (TBK)** — RG 04.02.2011, Sayı 27836
- **6102 sayılı Türk Ticaret Kanunu (TTK)** — RG 14.02.2011, Sayı 27846
- **4721 sayılı Türk Medeni Kanunu (TMK)** — RG 08.12.2001, Sayı 24607
- **6502 sayılı Tüketicinin Korunması Hakkında Kanun (TKHK)** — RG 28.11.2013, Sayı 28835 (tüketici sözleşmeleri)
- **7036 sayılı İş Mahkemeleri Kanunu** (iş sözleşmeleri)
- **4857 sayılı İş Kanunu** (iş sözleşmeleri)
- **6100 sayılı Hukuk Muhakemeleri Kanunu (HMK)** — m.412 (tahkim şartı — yazılı şekil)
- **5718 sayılı Milletlerarası Özel Hukuk ve Usul Hukuku Hakkında Kanun (MÖHUK)** — yabancı hukuk seçimi

> Tüm atıflar [mevzuat.gov.tr](https://mevzuat.gov.tr) üzerinden doğrulanmalı. Yürürlükten kalkmış 818 sayılı BK ve 6762 sayılı TTK'ya atıf YASAKTIR.

## Sözleşmenin Geçerlilik Koşulları

| Koşul | Dayanak |
|-------|---------|
| Hukuki ehliyet | TMK m.9-16 |
| Karşılıklı ve birbirine uygun irade beyanı | TBK m.1 |
| Konusu belirli veya belirlenebilir olma | TBK m.27 |
| Hukuka ve ahlaka aykırı olmama | TBK m.27 |
| İmkânsız olmama (objektif imkânsızlık) | TBK m.27 |
| Şekil şartı (varsa) | TBK m.12 |

## Sık Başvurulan TBK / TTK Maddeleri

| Madde | Konu | Sözleşme İncelemede Kritik Nokta |
|-------|------|----------------------------------|
| TBK m.1 | Sözleşmenin kurulması | Teklif ve kabul analizi |
| TBK m.12 | Şekil serbestisi ve istisnaları | Kanunen yazılı/noter şartlı sözleşmeler |
| TBK m.19-20 | Muvazaa | Görünürdeki sözleşme ile gerçek iradenin uyumu |
| TBK m.25 | Genel işlem koşulları — yazılmamış sayılan | Tek taraflı, şaşırtıcı hükümler |
| TBK m.26 | Sözleşme özgürlüğü | Emredici hukuka aykırılık kontrolü |
| TBK m.27 | Kesin hükümsüzlük | Konu, sebep, ahlak, imkânsızlık |
| TBK m.29-30 | Yanılma (hata) | İrade sakatlıkları |
| TBK m.36 | Korkutma (ikrah) | İrade sakatlıkları |
| TBK m.37-38 | Gabin (aşırı yararlanma) | Edimlerin oransızlığı |
| TBK m.112-118 | Borca aykırılık / zarar | Tazminat sorumluluğu |
| TBK m.117-126 | Temerrüt | Mehil tayini, fesih hakkı |
| TBK m.136-138 | İfa imkânsızlığı ve uyarlama | Öngörülmeyen hal, mücbir sebep |
| TBK m.138 | Aşırı ifa güçlüğü (uyarlama) | Mahkemece uyarlama talebi |
| TBK m.146 | Genel zamanaşımı | 10 yıl |
| TBK m.147 | Kısa zamanaşımı | 5 yıl (bazı alacaklar) |
| TBK m.158 | İkrar veya teyit ile kesilen zamanaşımı | — |
| TBK m.179-182 | Cezai şart | m.182/3 indirim yetkisi hakimin görevidir |
| TBK m.210-218 | Satış sözleşmesi — ayıba karşı tekeffül | — |
| TBK m.299-338 | Kira sözleşmesi | Konut ve çatılı iş yeri kiralarına özel koruma |
| TBK m.393-447 | Hizmet sözleşmesi | Rekabet yasağı m.444-447 |
| TBK m.555-580 | Adi ortaklık | — |
| TTK m.18 | Tacir — özel yükümlülükler | m.18/3 tacirler arası ihtar şekilleri |
| TTK m.54-63 | Haksız rekabet | Ticari sırrın korunması |
| TTK m.124-210 | Ticaret şirketleri | Temsil yetkisi denetimi |

## Output Template (TR — Rapor İskeleti)

Agent üretilen raporu bu iskeleti takip ederek Türkçe yazar.

```
SÖZLEŞME İNCELEME RAPORU

1. GENEL BİLGİLER
   - Sözleşme türü (satış / hizmet / kira / distribütörlük / ...)
   - Taraflar ve konumları (A = müvekkil, B = karşı taraf)
   - Sözleşme tarihi, süresi, uygulanacak hukuk, yetkili mahkeme
   - İnceleme aşaması (müzakere / imza öncesi / imza sonrası)

2. RİSK MATRİSİ
   Her maddenin 🟢 🟡 🔴 etiketiyle değerlendirmesi.

   | Madde No | Konu | Risk | Bulgu | Hukuki Dayanak | Öneri |
   |----------|------|------|-------|----------------|-------|
   | Md. 5    | Cezai şart | 🔴 | Fahiş; TBK m.182/3 indirim riski | TBK m.179, m.182/3 | Tutar %X'e çekilsin veya "kısmi indirim müvekkili etkilemeyecek" ibaresi eklensin |
   | Md. 8    | Fesih | 🟡 | Karşı tarafa tek taraflı sınırsız hak | TBK m.126 | Haklı sebep / süre eklensin |
   | ...      | ...  | ... | ...   | ...            | ...   |

3. EKSİK MADDELER
   Sözleşme türüne göre standart olması gereken maddeler:
   - [ ] Mücbir sebep tanımı eksik
   - [ ] KVKK uyumu eki yok (veri işleme varsa)
   - [ ] Devir yasağı yok
   - ...

4. MUĞLAK İFADELER
   - "mümkün olan en kısa sürede" (Md. 3) → öneri: "sipariş tarihinden itibaren 7 iş günü"
   - "makul ölçüde" (Md. 11) → öneri: ölçü kriteri tanımlansın

5. TARAFLAR ARASI DENGE ANALİZİ
   - Hangi tarafın lehine ağırlık var? (somut gerekçe ile)
   - Müvekkil açısından net zayıf pozisyon sahaları
   - Pazarlık kaldıracı sunan karşılık maddeler

6. ÖNCELİKLİ AKSİYONLAR
   Üç kategoride sıralı liste:
   - 🔴 HEMEN DEĞİŞTİRİN (imzalamadan önce zorunlu)
   - 🟡 MÜZAKERE EDİN (risk azaltıcı, imkân varsa)
   - 🟢 KABUL EDİLEBİLİR (not: izlenmesi yeterli)

7. GERÇEKLEŞMEYEN / ŞÜPHELİ REFERANSLAR
   - Yürürlükten kalkmış bir kanuna atıf yapılmış mı?
   - Sözleşmede anılan bir ek / taahhüt eksik mi?

---
[DISCLAIMER hook: core/DISCLAIMER.md aynen eklenir, [Date] = GG.AA.YYYY]
```

## Sözleşme İnceleme Kontrol Noktaları

### Temel (her sözleşme için)

- [ ] Tarafların ehliyeti, gerçek/tüzel kişi teyidi
- [ ] Tüzel kişiyi temsile yetkili kişinin yetkisi (imza sirküleri / ticaret sicili)
- [ ] Sözleşmenin konusu belirli mi?
- [ ] Şekil şartı aranıyor mu? (örn. taşınmaz satışı noterde, tüketici kredisi yazılı, tahkim sözleşmesi yazılı TBK m.12 / 6100 s.K. m.412)
- [ ] Karşılıklı edimler dengeli mi? (gabin riski, TBK m.28)
- [ ] Yer alan atıflar güncel mevzuata mı? (yürürlükten kalkmış kanuna atıf hükümsüzlük riski taşır)

### Standart olması gereken maddeler

- Taraflar ve tebligat adresleri
- Konu ve kapsam
- Yürürlük ve süre
- Edim tanımları ve teslim/ifa koşulları
- Ödeme koşulları ve gecikme faizi
- Gizlilik
- Mücbir sebep (TBK m.136-138 ile uyumlu)
- Devir yasağı / devir koşulları
- Fesih sebepleri (haklı fesih, tazminatlı fesih ayrımı)
- Cezai şart (orantılı, TBK m.182/3 indirim riski dikkate alınarak)
- Uygulanacak hukuk ve yetkili mahkeme / tahkim
- Bildirim/tebligat usulü (TTK m.18/3 tacirler arası)
- Sözleşme dili ve nüsha sayısı

### Yüksek Risk Maddeleri

- Sorumluluk sınırlandırma ve kaldırma (TBK m.115: ağır kusur ve kasten sorumluluktan kaçınılamaz — mutlak sınır)
- Cezai şart tutarı (TBK m.182/3 hakim indirimi)
- Tek taraflı fesih / tek taraflı değişiklik hakkı (GİK kontrolü TBK m.20-25)
- Rekabet yasağı (TBK m.444-447 — yer, süre, konu sınırlaması; m.445 hakim takdiri)
- Cayma / dönme hakkından feragat (TKHK m.48 emredici hükme aykırılık)
- Tahkim şartı (yetkili mahkeme yerine — şekil: 6100 s.K. m.412)
- KVKK uyumu (taraflardan biri veri sorumlusu ise veri işleme ekleri gerekir)

## Eksik Madde Tespit Rehberi (Sözleşme Türüne Göre)

### Satış Sözleşmesi (TBK m.207-281)
Ayıba karşı tekeffül, satıcının zapttan sorumluluğu, risk geçişi, teslim yeri/zamanı

### Hizmet / Vekalet / Eser Sözleşmesi (TBK m.393-512)
Ücret, azil/istifa, özen borcu, ifa yeri, rekabet yasağı

### Kira Sözleşmesi (TBK m.299-378)
Kira bedeli, artış oranı (TBK m.344 — TÜFE sınırı), depozito, onarım, ayıplı ifa

### Ticari / Distribütörlük / Franchise
Münhasırlık, bölge, hedefler, fesih tazminatı, TTK m.122 portföy tazminatı (acente)

### İş Sözleşmesi (4857 s.K.)
Deneme süresi, yıllık izin, fazla mesai, ihbar süresi (İK m.17), iş güvencesi kapsamı (İK m.18)

### Tüketici Sözleşmesi (TKHK)
Ön bilgilendirme, cayma hakkı, mesafeli sözleşmede 14 gün (TKHK m.48, Mesafeli Sözleşmeler Yönetmeliği)

## Muğlak İfade Tespit Örnekleri

Aşağıdaki ifadeler uyuşmazlığa açıktır — sözleşme incelemesinde işaretlenmelidir:

- "mümkün olan en kısa sürede" → yerine kesin gün / iş günü
- "makul süre" → yerine sayısal süre
- "önemli değişiklik" → yerine kriter listesi
- "iyi niyet çerçevesinde" → yerine somut yükümlülükler
- "sektör standartları" → yerine atıf yapılan standart adı
- "gerektiğinde" → yerine hangi şartlarda

## İndirim ve Uyarlama Mekanizmaları (Hakim Müdahalesi)

- **TBK m.182/3 — Cezai şart indirimi:** Hakim aşırı gördüğü cezai şartı indirebilir, bu yetkisinden taraflar peşinen vazgeçemez. Sözleşmeye "hakim indirim yapamaz" ibaresi konması hükümsüzdür.
- **TBK m.138 — Uyarlama:** Aşırı ifa güçlüğü hâlinde taraflardan biri uyarlama talep edebilir; sözleşmede feragat geçerli olmayabilir.
- **TBK m.25 — Yazılmamış sayılma:** Genel işlem koşullarında beklenilmeyen şaşırtıcı hükümler yazılmamış sayılır.

## Pre-Generation HARD-GATE Template (TR)

Agent analize başlamadan ÖNCE beş soruyu Türkçe olarak sorar ve somut yanıt almadan ilerlemez:

```
Analize başlamadan önce birkaç soruyu netleştirmem gerekiyor:

1. Bu sözleşmede hangi tarafı temsil ediyorsunuz?
   (Taraf A mı, Taraf B mi, üçüncü taraf mı?
    Analiz bu tarafın lehine/aleyhine yönelecek.)

2. Sözleşme hangi aşamada? (müzakere / imza öncesi / imza sonrası)
   İmza sonrası ise aksiyonlar kısıtlı olur.

3. Özellikle endişe duyduğunuz madde(ler) var mı?

4. Uygulanacak hukuk Türk Hukuku mu? Yetkili mahkeme / tahkim
   şartı var mı? (Sözleşmede yazılıysa teyit edelim.)

5. Sözleşme tipik sektörünüze özgü mü?
   (Örn. ticari satış / distribütörlük / hizmet / iş sözleşmesi)

Bu beş sorunun tamamına somut yanıt almadan analize başlamıyorum.
Bilgi eksikse ve varsayım yapmamı isterseniz bunu da ayrıca
belirtmem gerekir — ancak tercih her zaman gerçek bilgi.
```

## Post-Generation HARD-GATE Template (TR)

Raporu teslim etmeden ÖNCE agent aşağıdaki özeti Türkçe olarak sunar:

```
Bu sözleşmede aşağıdaki maddeler en yüksek riskli kısımlardır:

1. [En riskli madde 1] — Risk: [kısa açıklama] → 💡 Alternatif: [metin]
2. [En riskli madde 2] — Risk: [kısa açıklama] → 💡 Alternatif: [metin]
3. [En riskli madde 3] — Risk: [kısa açıklama] → 💡 Alternatif: [metin]

Öncelikli aksiyonlardan hangilerini detaylandırmamı istersiniz?
Karşı tarafa sunulacak redline taslağını hazırlayayım mı?
Tespit ettiğim eksik maddeler için alternatif metin önerisi ister misiniz?
```

Kullanıcı onayı alınmadan rapor TESLİM EDİLMEZ.

## Jurisdiction-Specific Red Flags (TR)

Aşağıdakilerden biri varsa rapor finalize EDİLMEZ, kullanıcıdan netleştirme istenir:

- Hangi tarafın temsil edildiği belirsiz (pre-gen HARD-GATE eksik)
- Sözleşmenin tipini belirleyememe (distribütörlük mü, franchise mi, satış mı?)
- Uygulanacak hukukun yabancı olması ve Türk hukuku referansları istenmesi (MÖHUK m.2, m.24)
- Sözleşmede okunamayan ek / ilave referansı (ek-1, protokol vb. metinde yok)
- Yürürlükten kalkmış mevzuata atıf — tespit edildi ama karşı tarafla teyit edilmedi
- Cezai şart tutarının sözleşme bedeline oranı belirlenemedi (fahiş mi değil mi?)
- Bir tarafın tüketici (TKHK m.3) olup olmadığı belirsiz — farklı koruma rejimi tetikler
- KVKK kapsamında veri işleme var ama sözleşmede veri eki yok — ayrı uyarı gerekir
- İş sözleşmesi incelemesinde iş güvencesi kapsamı (İK m.18: 30 işçi + 6 ay kıdem) teyit edilmedi

## Jurisdiction-Specific Anti-Patterns (TR)

- ❌ Yürürlükten kalkmış 818 s. BK veya 6762 s. TTK'ya atıf
- ❌ Cezai şart için TBK m.182/3 hakim indirim yetkisini görmezden gelip "sabit tutar" tavsiye etmek
- ❌ Tüketici sözleşmesinde TKHK m.5 emredici hükümlerine aykırı maddeleri "risk: düşük" etiketlemek
- ❌ Sorumluluk sınırlandırma hükümlerini TBK m.115 (kasıt/ağır kusurdan kaçınılamaz) testini yapmadan geçirmek
- ❌ Rekabet yasağını TBK m.444-447 yer/süre/konu sınırı testi olmadan geçerli saymak
- ❌ Tahkim şartını 6100 sayılı HMK m.412 yazılı şekil zorunluluğunu teyit etmeden geçerli saymak
- ❌ Emredici hukuka aykırılık (TBK m.27) testini atlayıp sadece "dengesiz" yorumuyla yetinmek
- ❌ Tacirler arası sözleşmelerde TTK m.18/3 bildirim şekli kontrolünü atlamak
- ❌ US-law terimleri (indemnification, hold harmless, warranty) Türk hukuku karşılıkları olmadan kopyalamak

## Jurisdiction-Specific SELF-TEST (TR)

```
- [ ] Atıfların tümü TBK / TTK / TMK / TKHK'nın yürürlükteki metnine uygun
- [ ] 818 s. BK veya 6762 s. TTK atfı YOK
- [ ] Cezai şart hükümleri TBK m.182/3 hakim indirim notu ile analiz edilmiş
- [ ] Sorumluluk sınırlandırma hükümleri TBK m.115 emredici sınırına göre değerlendirilmiş
- [ ] Rekabet yasağı varsa TBK m.444-447 (yer/süre/konu) testi uygulanmış
- [ ] Taraflardan biri tüketici ise TKHK m.5 haksız şart kontrolü yapılmış
- [ ] Tacirler arası ise TTK m.18/3 bildirim şekli teyit edilmiş
- [ ] Tahkim şartı varsa HMK m.412 yazılı şekil kontrolü yapılmış
- [ ] Sözleşmede kişisel veri işleme varsa KVKK kapsamında veri işleme eki öneri olarak eklenmiş
- [ ] İş sözleşmesi ise 4857 s.K. m.18 iş güvencesi kapsamı kontrolü yapılmış
- [ ] Konu/sebep/ahlak/imkansızlık (TBK m.27) testi uygulandı
```

## Kaynaklar

- Yargıtay içtihatları ([karararama.yargitay.gov.tr](https://karararama.yargitay.gov.tr))
- Anayasa Mahkemesi bireysel başvuru kararları
- Resmi Gazete ([resmigazete.gov.tr](https://resmigazete.gov.tr))

## Legal References (TR)

- **6098 sayılı Türk Borçlar Kanunu (TBK)** — RG 04.02.2011, Sayı 27836
  - m.1, m.12, m.19-20, m.25-27, m.29-30, m.36-38, m.112-118, m.117-126, m.136-138, m.146-147, m.179-182, m.444-447, m.115
- **6102 sayılı Türk Ticaret Kanunu (TTK)** — RG 14.02.2011, Sayı 27846
  - m.18/3, m.54-63, m.122
- **4721 sayılı Türk Medeni Kanunu (TMK)** — RG 08.12.2001, Sayı 24607
  - m.2 (dürüstlük kuralı), m.9-16 (ehliyet)
- **6502 sayılı Tüketicinin Korunması Hakkında Kanun (TKHK)** — RG 28.11.2013, Sayı 28835
- **4857 sayılı İş Kanunu** — RG 10.06.2003, Sayı 25134
- **6100 sayılı Hukuk Muhakemeleri Kanunu (HMK)** — RG 04.02.2011, Sayı 27836
  - m.412 (tahkim şartı — yazılı şekil)
- **5718 sayılı Milletlerarası Özel Hukuk ve Usul Hukuku Hakkında Kanun (MÖHUK)** — yabancı hukuk seçimi
- Yargıtay içtihatları ([karararama.yargitay.gov.tr](https://karararama.yargitay.gov.tr))

Her atıf [mevzuat.gov.tr](https://mevzuat.gov.tr) üzerinden doğrulanmalı. Uydurma madde YASAKTIR.
