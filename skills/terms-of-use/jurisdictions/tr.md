# Türkiye — Kullanım Koşulları Hukuki Referansları

## Temel Mevzuat

- **6098 sayılı Türk Borçlar Kanunu (TBK)** — genel sözleşme hükümleri, GİK denetimi (m.20-25)
- **6502 sayılı Tüketicinin Korunması Hakkında Kanun (TKHK)** — RG 28.11.2013, Sayı 28835
- **6563 sayılı Elektronik Ticaretin Düzenlenmesi Hakkında Kanun** — RG 05.11.2014, Sayı 29166
- **5651 sayılı İnternet Ortamında Yapılan Yayınların Düzenlenmesi Hakkında Kanun** — RG 23.05.2007, Sayı 26530
- **5846 sayılı Fikir ve Sanat Eserleri Kanunu (FSEK)**
- **6698 sayılı Kişisel Verilerin Korunması Kanunu (KVKK)** — çapraz referans
- **Mesafeli Sözleşmeler Yönetmeliği** — RG 27.11.2014, Sayı 29188
- **Elektronik Ticarette Hizmet Sağlayıcı ve Aracı Hizmet Sağlayıcılar Hakkında Yönetmelik** — RG 26.08.2015
- **7416 sayılı Kanun ile Elektronik Ticaret Kanunu değişiklikleri** — 07.07.2022 (aracı hizmet sağlayıcı yükümlülükleri genişletildi)
- **6325 sayılı Arabuluculuk Kanunu** — RG 22.06.2012, Sayı 28331
- **6493 sayılı Ödeme ve Menkul Kıymet Mutabakat Sistemleri Kanunu** — ödeme alıyorsa
- **4721 sayılı Türk Medeni Kanunu (TMK)** — m.16 (sınırlı ehliyet / yaş)

> Her atıf [mevzuat.gov.tr](https://mevzuat.gov.tr) üzerinden doğrulanmalı.

## Zorunlu Bölümler (Her Kullanım Koşullarında)

1. **Tanımlar** — platform, kullanıcı, hizmet, içerik, hesap
2. **Hizmet Sağlayıcı Kimliği** — 6563 s.K. m.3, m.5 (unvan, MERSİS, iletişim)
3. **Hizmetin Kapsamı ve Niteliği**
4. **Üyelik / Hesap Koşulları** — yaş sınırı, kayıt şartları, hesap güvenliği
5. **Kullanıcı Yükümlülükleri** — yasaklı davranışlar (5651 s.K. m.8 yasadışı içerik)
6. **Fikri Mülkiyet Hakları** — FSEK m.1, m.14, platform içeriği ve kullanıcı içeriği
7. **Sorumluluk Sınırlandırması** — TBK m.115 emredici sınırı
8. **Kişisel Verilerin Korunması** — KVKK referansı + ayrı Privacy Policy linki
9. **Fesih Koşulları** — haklı fesih, ihlal halinde askıya alma
10. **Uyuşmazlık Çözümü** — yetkili mahkeme, arabuluculuk (6325 s.K.), tüketici hakem heyeti (TKHK m.68)
11. **Değişiklik Hakkı ve Bildirim**
12. **Yürürlük ve Uygulanacak Hukuk**

## Output Template (TR — Türkçe Belge İskeleti)

Agent belgeyi bu iskeleti takip ederek Türkçe yazar. Platform türüne bağlı koşullu bölümler ("Platform Türüne Göre Özel Maddeler" altındaki kurallara göre) eklenir.

```
KULLANIM KOŞULLARI

1. TARAFLAR VE KAPSAM
   - Hizmet Sağlayıcı kimliği (6563 s.K. m.3, m.5)
   - Kullanıcı tanımı

2. TANIMLAR

3. HİZMETİN KAPSAMI VE NİTELİĞİ
   - Platform türüne özgü detay

4. ÜYELİK / HESAP AÇMA KOŞULLARI
   - Yaş sınırı (varsa)
   - Hesap güvenliği ve bildirim yükümlülüğü
   - Kimlik doğrulama (varsa)

5. KULLANICI YÜKÜMLÜLÜKLERİ
   - Yasaklı davranış listesi (5651 s.K. m.8 yasadışı içerik)

6. ÖDEME VE ABONELİK KOŞULLARI (paid_service == true ise)
   - Ücret, fatura, yenileme, iptal
   - İade / cayma (TKHK m.48 varsa)

7. FİKRİ MÜLKİYET
   - Platform içeriği sahipliği (FSEK)
   - (UGC varsa) Kullanıcı içeriği için kullanıcıdan platforma lisans
   - Telif hakkı ihlali bildirim prosedürü (5651 s.K. m.9; FSEK m.71)

8. KİŞİSEL VERİLERİN KORUNMASI
   - Privacy Policy'ye referans (çelişki YASAK)

9. HİZMETİN KESİNTİSİ VE SÜRDÜRÜLEBİLİRLİĞİ
   - (SaaS ise) SLA, planlı bakım

10. SORUMLULUĞUN SINIRLANDIRILMASI
    - TBK m.115 emredici sınırına uygun
    - Tüketici ise TKHK m.5 haksız şart kontrolü gözetilmiş

11. FESİH KOŞULLARI
    - Haklı fesih (ihlal halinde)
    - Kullanıcının hesap kapatma hakkı
    - İade / veri taşınabilirliği (SaaS için kritik)

12. UYUŞMAZLIK ÇÖZÜMÜ
    - Tüketici ise TKHK m.68 Tüketici Hakem Heyeti / Mahkemesi
    - B2B ise yetkili mahkeme (preferences.default_court) / arabuluculuk

13. DEĞİŞİKLİK HAKKI VE BİLDİRİM
    - Tek taraflı sınırsız değişiklik YASAK (TBK m.24)
    - Esaslı değişiklikte ön bildirim süresi

14. UYGULANACAK HUKUK VE YÜRÜRLÜK
    - Türk Hukuku
    - Yürürlük tarihi

---
[DISCLAIMER hook: core/DISCLAIMER.md aynen eklenir, [Date] = GG.AA.YYYY]
```

**Platform türüne göre koşullu bölümler:**
- Marketplace / hybrid ⇒ "Aracı Hizmet Sağlayıcı Yükümlülükleri" bölümü (6563 s.K. 7416 değişiklikleri)
- SaaS ⇒ §9 altında "Hizmet Seviyesi Taahhüdü (SLA)" alt bölümü
- Mobil uygulama ⇒ "Uygulama Mağazası Kuralları ve Cihaz İzinleri"

## Sorumluluk Sınırlandırması — TBK m.115 Emredici Sınırı

- Ağır kusurdan (TBK m.115/1) veya kasttan doğan sorumluluktan **önceden yapılan feragat HÜKÜMSÜZDÜR**.
- "Hiçbir durumda sorumlu değiliz" türü mutlak feragat maddesi TBK m.115/2'ye aykırıdır ve kısmi hükümsüzlüğe yol açar.
- Hafif kusurdan sorumluluk sınırlandırılabilir ama TKHK kapsamında tüketici sözleşmesinde bu dahi tartışmalıdır (TKHK m.5 haksız şart kontrolü).

## Genel İşlem Koşulları Denetimi (TBK m.20-25)

- **m.21 — Kapsam:** Karşı tarafın kolayca okuyup anlayabileceği biçimde sunulmamışsa bağlayıcı olmaz.
- **m.22 — Çatışma:** Taraflar arası özel anlaşma GİK'e üstündür.
- **m.23 — Yorum:** Belirsizlik halinde düzenleyen aleyhine yorumlanır (contra proferentem).
- **m.24 — Değiştirme yasağı:** Düzenleyenin tek taraflı sınırsız değişiklik yapmasına imkân veren hüküm hükümsüzdür.
- **m.25 — Yazılmamış sayılma:** Şaşırtıcı, beklenilmeyen hükümler yazılmamış sayılır.

## E-Ticaret Zorunlulukları (6563 s.K.)

Eğer platform mal veya hizmet satışı yapıyorsa (aracı olarak dahi):

- **m.3, m.5** — Hizmet sağlayıcı ve kimlik bilgileri (elektronik iletişim araçlarıyla kesintisiz erişilebilir olmalı)
- **m.6** — Sipariş aşamasında kullanıcıya ön bilgilendirme, hataları tanıma ve düzeltme imkânı
- **m.7** — Sipariş onayı / sözleşme metni kalıcı veri saklayıcısıyla sunulmalı
- **7416 s.K.** (2022 değişiklikleri) — aracı hizmet sağlayıcılar için kayıt, sözleşme, satıcı bilgilendirme yükümlülükleri

## Mesafeli Sözleşme Yükümlülükleri

Tüketiciye yönelik uzaktan satışta **Kullanım Koşulları tek başına YETERLİ DEĞİLDİR.** Ek olarak:

- **Ön Bilgilendirme Formu** — TKHK m.48, Mesafeli Sözleşmeler Yönetmeliği m.5
- **Mesafeli Satış Sözleşmesi** — ayrı belge
- **Cayma hakkı** — 14 gün (TKHK m.48, Yönetmelik m.9-16)
- **Teslimat süresi** — en geç 30 gün (Yönetmelik m.18)
- **Ödeme ve iade koşulları** — Yönetmelik m.13, m.14

Bu belgeler ayrı skill'ler veya ayrı üretimler gerektirir; kullanım koşullarına gömülemez.

## Platform Türüne Göre Özel Maddeler

### Web Sitesi / Bloglar
- Çerez politikası ayrı belge (e-Privacy + KVKK m.10 aydınlatma)
- Erişilebilirlik (WCAG tavsiyesi, hukuken zorunlu değil ama önerilir)
- Yorum / kullanıcı katkısı yönetimi (5651 s.K. m.5 yer sağlayıcı sorumluluk)

### Mobil Uygulama
- Uygulama mağazası (App Store / Google Play) kuralları ile çatışmama
- Cihaz izinleri (kamera, konum, rehber) — KVKK aydınlatma
- Güncelleme politikası ve sürüm desteği
- Abonelik ise mağaza iade politikası ile uyum

### SaaS
- Hizmet seviyesi taahhüdü (SLA) — uptime, kredi mekanizması
- Veri yedekleme, dışa aktarma (portability)
- Hizmet kesintisi / bakım pencereleri
- Abonelik yenileme ve iptal (TKHK belirli süreli sözleşme kontrolü)
- Veri işleme sözleşmesi (DPA) eki — B2B ise

### Pazaryeri / Marketplace (Aracı Hizmet Sağlayıcı)
- 6563 s.K. 7416 değişiklikleri ile genişletilmiş yükümlülükler
- Satıcılardan alınacak bilgiler (Yönetmelik)
- Kötüye kullanım / sahte ilan prosedürü
- ETBİS (Elektronik Ticaret Bilgi Sistemi) kaydı

### Kullanıcı İçeriği Üretilen Platformlar (UGC)
- İçerik lisansı: kullanıcıdan platforma verilen kullanım lisansı kapsamı
- Telif hakkı ihlali bildirim prosedürü (notice-and-takedown; FSEK m.71, 5651 s.K. m.9)
- İçerik denetim politikası
- Yasaklı içerik tanımı (5651 s.K. m.8 listesi)

## Yaş Sınırı

- 18 yaş altı kullanıcılar için veli/vasi onayı (TMK m.16 — sınırlı ehliyet)
- KVKK açısından: Kurul rehberi — 13 yaş altı için veli rızası
- Ürün/hizmet türüne göre özel yaş sınırı (alkol, kumar, yetişkin içeriği)

## Uyuşmazlık Çözümü

- **Tüketici uyuşmazlıkları:** TKHK m.68 parasal sınırlara göre Tüketici Hakem Heyeti / Tüketici Mahkemesi
- **Arabuluculuk:** 6325 s.K. (bazı uyuşmazlıklarda dava şartı)
- **B2B:** Tarafların anlaşacağı yetkili mahkeme veya tahkim (HMK m.17-19; tahkim için m.412 yazılı şekil)

## Çapraz Referans — Privacy Policy ile Tutarlılık

Kullanım Koşulları ve Gizlilik Politikası arasında çelişki BULUNAMAZ:
- Veri işleme amaçları, aktarım ve saklama süreleri Privacy Policy'de detaylandırılır
- Kullanım Koşullarında yalnızca referans + özet yapılır
- "Verilerinizi reklam amacıyla kullanabiliriz" gibi bir ibare Privacy Policy'de yoksa Kullanım Koşullarında olmamalı

## Companion-Documents HARD-GATE Template (TR)

SKILL.md'deki Companion-Documents HARD-GATE'in Türkçe kullanıcıya sunum metni:

```
E-ticaret / mesafeli sözleşme faaliyeti tespit edildi. Türk hukukunda
Kullanım Koşulları TEK BAŞINA yeterli DEĞİLDİR. Aşağıdaki belgeler de
ZORUNLUDUR:

1. Ön Bilgilendirme Formu — 6502 sayılı TKHK m.48 + Mesafeli
   Sözleşmeler Yönetmeliği m.5
2. Mesafeli Satış Sözleşmesi — Mesafeli Sözleşmeler Yönetmeliği
3. (Aracı hizmet sağlayıcıysanız) 6563 s.K. 7416 değişiklikleri
   ile genişletilmiş bilgilendirme yükümlülükleri
4. (Ödeme alıyorsanız) PCI-DSS uyumu ve ödeme kuruluşu mevzuatı
   (6493 s.K.)
5. Çerez Politikası (ayrı belge — e-Privacy + KVKK m.10)
6. Privacy Policy (privacy-policy skill'i ile ayrı üretilmeli)

Devam ediyorum — ama bu ek belgeleri de hazırlamak ister misiniz?
(Evet dersiniz, ilgili skill'lere yönlendiririm.)
```

Kullanıcı bu bilgilendirmeyi almadan taslak yazımı devam ettirilmez.

## Post-Generation HARD-GATE Template (TR)

```
Bu Kullanım Koşullarında aşağıdaki maddeler en yüksek riskli kısımlardır:

1. [§10 Sorumluluğun Sınırlandırılması] — Risk: TBK m.115 emredici
   hükmü sebebiyle ağır kusur/kasıt için mutlak feragat mümkün
   değil; tüketici ise TKHK m.5 haksız şart kontrolü tetiklenir.
   💡 Alternatif: [kusur derecesine göre kademeli sorumluluk metni]

2. [§13 Değişiklik Hakkı] — Risk: TBK m.24'e göre tek taraflı
   sınırsız değişiklik hükümsüz sayılabilir.
   💡 Alternatif: ön bildirim süresi (örn. 30 gün) + kullanıcıya
   fesih hakkı tanıyan metin.

3. [§12 Uyuşmazlık Çözümü] — Risk: Tüketici ise yetkili mahkeme
   seçimi TKHK m.68 karşısında etkisiz kalabilir.
   💡 Alternatif: Tüketici için ayrı fıkra, B2B için ayrı fıkra.

Ayrıca tespit ettim:
- Privacy Policy ile çapraz kontrol [yapıldı / yapılmadı — ayrı
  belge henüz yok].
- E-ticaret tespit edildi ve ek belge uyarısı [verildi / gerek yok].

Bu kısımları özel durumunuza göre incelediniz mi?
Alternatif metinleri uygulayayım mı?
```

Kullanıcı onayı alınmadan belge TESLİM EDİLMEZ.

## Jurisdiction-Specific Anti-Patterns (TR)

- ❌ "Hiçbir durumda sorumlu değiliz" benzeri mutlak feragat (TBK m.115 ihlali)
- ❌ Privacy Policy ile çelişen veri işleme ifadeleri
- ❌ Yaş sınırı belirtmeden çocuklara yönelik hizmet
- ❌ Tek taraflı sınırsız değişiklik hakkı (TBK m.24 ihlali)
- ❌ Tüketici sözleşmesinde TKHK m.68'i bertaraf eden yetki şartı
- ❌ 5651 s.K. yasadışı içerik referansı olmadan UGC bölümü
- ❌ Aracı hizmet sağlayıcı (marketplace) için 7416 s.K. sonrası yükümlülüklerin atlanması
- ❌ Cayma hakkı / Ön Bilgilendirme Formunu Kullanım Koşullarına gömmek (ayrı belge zorunlu)
- ❌ Çerez politikasını Kullanım Koşullarına yedirmek (ayrı belge)

## Jurisdiction-Specific SELF-TEST (TR)

```
- [ ] Platform türü doğru belirlendi ve koşullu bölümler eklendi (SaaS → SLA; marketplace → aracı yükümlülükleri)
- [ ] Hizmet sağlayıcı kimlik bilgileri 6563 s.K. m.3, m.5'e uygun
- [ ] TBK m.115 sınırına uygun sorumluluk maddesi yazıldı (mutlak feragat YOK)
- [ ] TBK m.24 ihlali yok: tek taraflı sınırsız değişiklik hakkı YOK
- [ ] UGC varsa: telif bildirim prosedürü (5651 s.K. m.9, FSEK m.71)
- [ ] Yaş sınırı açıkça belirtildi (veya evrensel erişim için gerekçe var)
- [ ] Ödeme/abonelik varsa TKHK m.48 cayma hakkı bilgisi VAR (ayrı ön bilgilendirme formu uyarısıyla)
- [ ] E-ticaret tetiği: companion-documents HARD-GATE uygulandı
- [ ] Privacy Policy çapraz kontrolü yapıldı (veya Privacy Policy eksikliği kullanıcıya bildirildi)
- [ ] Çerez politikası içeri gömülmedi (ayrı belge referansı var)
- [ ] Uyuşmazlık çözümü: tüketici için TKHK m.68 referansı, B2B için yetkili mahkeme
- [ ] Uygulanacak hukuk = Türk Hukuku; yürürlük tarihi eklendi
```

## Legal References (TR)

- **6098 sayılı TBK** — m.20-25 (GİK denetimi), m.115 (sorumluluk sınırlandırma)
- **6502 sayılı TKHK** — RG 28.11.2013, Sayı 28835 — m.5 (haksız şart), m.48 (mesafeli), m.68 (tüketici hakem heyeti / mahkeme parasal sınırları)
- **6563 sayılı Elektronik Ticaretin Düzenlenmesi Hakkında Kanun** — RG 05.11.2014, Sayı 29166 — m.3, m.5, m.6, m.7
  - 7416 s.K. (2022) ile aracı hizmet sağlayıcı yükümlülükleri genişletildi
- **Mesafeli Sözleşmeler Yönetmeliği** — RG 27.11.2014, Sayı 29188
- **Elektronik Ticarette Hizmet Sağlayıcı ve Aracı Hizmet Sağlayıcılar Hakkında Yönetmelik** — RG 26.08.2015
- **5651 sayılı İnternet Ortamında Yapılan Yayınların Düzenlenmesi Hakkında Kanun** — m.5, m.8, m.9
- **5846 sayılı FSEK** — m.1, m.14, m.71
- **6698 sayılı KVKK** — çapraz referans (Privacy Policy ile)
- **4721 sayılı TMK** — m.16 (sınırlı ehliyet / yaş)
- **6325 sayılı Arabuluculuk Kanunu** — RG 22.06.2012, Sayı 28331
- **6493 sayılı Ödeme ve Menkul Kıymet Mutabakat Sistemleri Kanunu** — ödeme alıyorsa

Her atıf [mevzuat.gov.tr](https://mevzuat.gov.tr) üzerinden doğrulanmalı. Uydurma madde YASAKTIR.
