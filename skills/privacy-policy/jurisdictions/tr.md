# Türkiye — Kişisel Verilerin Korunması (KVKK)

## Temel Mevzuat

- **6698 sayılı Kişisel Verilerin Korunması Kanunu (KVKK)** — Resmî Gazete 07.04.2016, Sayı 29677
- **Kişisel Verilerin Silinmesi, Yok Edilmesi veya Anonim Hale Getirilmesi Hakkında Yönetmelik** — RG 28.10.2017, Sayı 30224
- **Aydınlatma Yükümlülüğünün Yerine Getirilmesinde Uyulacak Usul ve Esaslar Hakkında Tebliğ** — RG 10.03.2018, Sayı 30356
- **Veri Sorumluları Sicili Hakkında Yönetmelik (VERBİS)** — RG 30.12.2017, Sayı 30286
- **Kişisel Verileri Koruma Kurulu (KVKK Kurul) kararları** — [kvkk.gov.tr](https://kvkk.gov.tr)

> Mevzuat linki: [mevzuat.gov.tr](https://www.mevzuat.gov.tr) üzerinden doğrulanmalıdır. Yürürlükten kalkmış hüküm atfı YASAKTIR.

## Zorunlu Politika Bölümleri (TR)

KVKK uyumlu Kişisel Verilerin Korunması ve İşlenmesi Politikasının içermesi gereken başlıklar — her başlığın dayanağı KVKK'nın ilgili maddesidir:

1. **Veri Sorumlusunun Kimliği** — KVKK m.10 (aydınlatma yükümlülüğü)
2. **İşlenen Kişisel Veri Kategorileri** — kimlik, iletişim, müşteri işlem, finansal vb.
3. **Kişisel Verilerin İşlenme Amaçları** — KVKK m.4 (genel ilkeler) ile uyumlu, meşru amaçlar
4. **İşlemenin Hukuki Sebebi** — KVKK m.5 (genel) ve m.6 (özel nitelikli) dayanakları
5. **Kişisel Verilerin Aktarılması** — KVKK m.8 (yurt içi) ve m.9 (yurt dışı)
6. **Kişisel Verilerin Toplanma Yöntemi** — otomatik / kısmen otomatik / otomatik olmayan
7. **Kişisel Verilerin Saklanma Süresi** — Saklama ve İmha Politikası referansı
8. **Veri Sahibinin Hakları** — KVKK m.11 (9 hak eksiksiz listelenmeli)
9. **Veri Güvenliği Tedbirleri** — KVKK m.12 (teknik ve idari tedbirler)
10. **VERBİS Kaydı Bilgisi** — yükümlü ise sicil numarası, yükümlü değil ise muafiyet gerekçesi
11. **Başvuru ve İletişim Yöntemleri** — KVKK m.13 (veri sorumlusuna başvuru)

## Output Template (TR — Türkçe Belge İskeleti)

Agent üretilen belgeyi bu iskeleti takip ederek yazar. Başlık yazımı, madde sırası ve dil Türkçe'dir.

```
KİŞİSEL VERİLERİN KORUNMASI VE İŞLENMESİ POLİTİKASI

1. VERİ SORUMLUSUNUN KİMLİĞİ
   - Unvan, adres, MERSİS/vergi no, iletişim

2. POLİTİKANIN AMACI VE KAPSAMI

3. TANIMLAR
   - KVKK m.3 tanımları (ilgili kişi, veri sorumlusu, veri işleyen, açık rıza vb.)

4. İŞLENEN KİŞİSEL VERİ KATEGORİLERİ
   - Kimlik, iletişim, müşteri işlem, finans, ... (sektöre göre)

5. KİŞİSEL VERİLERİN İŞLENME AMAÇLARI

6. KİŞİSEL VERİLERİN İŞLENMESİNİN HUKUKİ SEBEPLERİ
   - KVKK m.5 dayanakları tek tek
   - Özel nitelikli veri varsa KVKK m.6 dayanakları

7. KİŞİSEL VERİLERİN TOPLANMA YÖNTEMİ

8. KİŞİSEL VERİLERİN AKTARILMASI
   - Yurt içi (KVKK m.8)
   - Yurt dışı (KVKK m.9) — alıcı ülkeler, dayanak

9. KİŞİSEL VERİLERİN SAKLANMA SÜRESİ

10. KİŞİSEL VERİ GÜVENLİĞİ TEDBİRLERİ
    - KVKK m.12, teknik ve idari tedbirler

11. VERBİS KAYDI BİLGİSİ
    - Sicil numarası veya muafiyet gerekçesi

12. İLGİLİ KİŞİNİN HAKLARI
    - KVKK m.11'deki 9 hak EKSİKSİZ

13. BAŞVURU YÖNTEMLERİ
    - KVKK m.13 + Veri Sorumlusuna Başvuru Usul ve Esasları Tebliği

14. POLİTİKANIN YÜRÜRLÜĞÜ VE GÜNCELLENMESİ

---
[DISCLAIMER hook: core/DISCLAIMER.md aynen eklenir, [Date] = GG.AA.YYYY]
```

## KVKK m.5 — İşleme Şartları (Genel Veriler)

1. İlgili kişinin **açık rızası** (m.5/1)
2. Kanunlarda açıkça öngörülmesi
3. Fiili imkânsızlık nedeniyle rızasını açıklayamayacak olanın hayatı/beden bütünlüğü
4. Bir **sözleşmenin kurulması veya ifasıyla doğrudan doğruya ilgili olması**
5. Veri sorumlusunun **hukuki yükümlülüğünü** yerine getirebilmesi
6. İlgili kişi tarafından **alenileştirilmiş** olması
7. Bir hakkın tesisi, kullanılması veya korunması
8. İlgili kişinin temel hak ve özgürlüklerine zarar vermemek kaydıyla veri sorumlusunun **meşru menfaati**

## KVKK m.6 — Özel Nitelikli Kişisel Veriler

Kapsam: Irk, etnik köken, siyasi düşünce, felsefi inanç, din, mezhep veya diğer inançlar, kılık ve kıyafet, dernek-vakıf-sendika üyeliği, sağlık, cinsel hayat, ceza mahkûmiyeti ve güvenlik tedbirleriyle ilgili veriler ile biyometrik ve genetik veriler.

İşleme şartları:

- **Sağlık ve cinsel hayat dışındaki özel nitelikli veriler:** Açık rıza VEYA kanunlarda açıkça öngörülme
- **Sağlık ve cinsel hayata ilişkin veriler:** Açık rıza VEYA kamu sağlığının korunması / koruyucu hekimlik / tıbbî teşhis / tedavi / sağlık hizmetleri yürütülmesi / sağlık hizmetleri finansmanı planlaması ve yönetimi amaçlarıyla sır saklama yükümlülüğü altındaki kişiler veya yetkili kurumlar tarafından
- Özel nitelikli veriler için Kurul'un öngördüğü **yeterli tedbirlerin** alınması ZORUNLU (KVKK Kurulu 31.01.2018 tarih, 2018/10 sayılı karar)

## KVKK m.8 — Yurt İçi Aktarım

m.5 ve m.6'daki şartlar sağlanması kaydıyla aktarılabilir. Açık rıza genellikle birincil dayanak; meşru menfaat ve sözleşmenin ifası da kullanılabilir.

## KVKK m.9 — Yurt Dışı Aktarım

- Yurt dışına aktarım için öncelikli şart: **yeterli korumaya sahip ülke** listesinde yer alma (Kurul ilan eder)
- Yeterli koruma yoksa: **yeterli korumayı taahhüt eden yazılı teklif** + Kurul izni
- Açık rıza tek başına yurt dışı aktarımı için yeterli olabilir ancak Kurul'un 02.05.2019 tarih 2019/125 sayılı kararında açık rızanın son çare olması gerektiği vurgulanmıştır

> **UYARI:** 12.03.2024 tarihli 7499 sayılı Kanun ile m.9 değiştirildi; "standart sözleşme" (standart contractual clauses) mekanizması tanıtıldı. Politika üretirken bu değişiklik kontrol edilmelidir.

## KVKK m.11 — Veri Sahibi Hakları (Zorunlu 9 Madde)

Her kişi, veri sorumlusuna başvurarak şu haklarını kullanabilir:

1. Kişisel veri işlenip işlenmediğini **öğrenme**
2. Kişisel verileri işlenmişse buna ilişkin **bilgi talep etme**
3. Kişisel verilerin işlenme **amacını** ve bunların amacına uygun kullanılıp kullanılmadığını öğrenme
4. Yurt içinde veya yurt dışında kişisel verilerin **aktarıldığı üçüncü kişileri** bilme
5. Kişisel verilerin eksik veya yanlış işlenmiş olması hâlinde bunların **düzeltilmesini** isteme
6. KVKK m.7'de öngörülen şartlar çerçevesinde kişisel verilerin **silinmesini veya yok edilmesini** isteme
7. (5) ve (6) bentleri uyarınca yapılan işlemlerin, kişisel verilerin aktarıldığı üçüncü kişilere **bildirilmesini** isteme
8. İşlenen verilerin **münhasıran otomatik sistemler** vasıtasıyla analiz edilmesi suretiyle kişinin kendisi aleyhine bir sonucun ortaya çıkmasına itiraz etme
9. Kişisel verilerin kanuna aykırı olarak işlenmesi sebebiyle zarara uğraması hâlinde **zararın giderilmesini** talep etme

## KVKK m.12 — Veri Güvenliği

Veri sorumlusu şunları sağlamakla yükümlüdür:

- Kişisel verilerin hukuka aykırı işlenmesini önleme
- Kişisel verilere hukuka aykırı erişilmesini önleme
- Kişisel verilerin muhafazasını sağlama

Kurul'un "Kişisel Veri Güvenliği Rehberi" (Teknik ve İdari Tedbirler) yol gösterici niteliktedir.

## VERBİS Yükümlülüğü

Veri Sorumluları Siciline (VERBİS) kayıt yükümlülüğü Yönetmelik'te belirtilen istisnalar dışında tüm veri sorumluları için geçerlidir. Muafiyet kriterleri Kurul ilanları ile güncellenmektedir — üretilen politikada ya sicil numarası belirtilmeli ya da muafiyet kategorisi gerekçelendirilmelidir.

## Başvuru Mekanizması

- Öncelikli yol: **Veri sorumlusuna yazılı / KEP / e-posta başvurusu** (KVKK m.13)
- Veri sorumlusu en geç **30 gün** içinde cevap vermek zorundadır
- Red, eksik cevap veya sessiz kalma hâlinde: **Kurul'a şikayet** (KVKK m.14, 30/60 gün süre)

## İdari Para Cezaları (KVKK m.18)

Ceza tutarları yıllık yeniden değerleme oranına göre güncellenir. Politika üretirken yasal uyum kritik — son Kurul ilanına bakılmalıdır.

## Post-Generation HARD-GATE Template (TR)

SKILL.md'deki post-generation HARD-GATE'in Türkçe kullanıcıya sunum metni. Agent aşağıdaki kalıbı somut değerlerle doldurarak sunar:

```
Bu politikada aşağıdaki maddeler en yüksek riskli kısımlardır:

1. [Hukuki sebep seçimi — KVKK m.5/2-... veya m.6/...] — Risk:
   seçilen dayanak her işleme amacını karşılamalıdır. Dayanak
   uymazsa işleme hukuka aykırı olur.
   💡 Alternatif: açık rızaya dayananlar ayrı bölümde listelensin.

2. [Yurt dışı aktarım bölümü] — Risk: Kurul kararı olmadan yurt
   dışı aktarım risklidir (KVKK m.9); son 7499 sayılı Kanun
   değişikliği gözden geçirilmeli.
   💡 Alternatif: aktarım varsa standart sözleşme / açık rıza
   mekanizması detaylandırılsın.

3. [Saklama süreleri] — Risk: "Gerekli olduğu sürece" gibi muğlak
   ifade KVKK m.4'e aykırıdır; kategori bazında süre belirtilmeli.
   💡 Alternatif: her veri kategorisi için maksimum süre tablosu.

Bu kısımları özel durumunuza göre incelediniz mi?
Alternatif önerileri uygulamak ister misiniz?
```

Kullanıcı onayı alınmadan belge TESLİM EDİLMEZ.

## Jurisdiction-Specific Anti-Patterns (TR)

- ❌ KVKK m.11'deki 9 hak listesinin eksik verilmesi (7 veya 8 hak listelemek)
- ❌ VERBİS kayıt durumu belirtilmeden politika üretmek (yükümlü / muaf kategorisi net olmalı)
- ❌ Yurt dışı aktarımda 7499 sayılı Kanun öncesi m.9 metnine atıf yapmak
- ❌ Özel nitelikli veri işlemede KVKK Kurulu 2018/10 sayılı kararındaki yeterli tedbirleri atlamak
- ❌ "Açık rıza" dayanağını her işleme amacına otomatik uygulamak (m.5/1 son çare olmalı)
- ❌ KVKK m.13 başvuru süresi ve Tebliğ referansının eksik bırakılması
- ❌ Aydınlatma yükümlülüğünü (m.10) politika içine karıştırarak ayrı aydınlatma metni ihtiyacını gizlemek
- ❌ E-ticaret müvekkili için sağlık sektörü şablonu gibi sektör uyumsuz veri kategorileri kopyalamak

## Jurisdiction-Specific SELF-TEST (TR)

```
- [ ] Tüm atıflar KVKK'nın yürürlükteki metnine uygun (özellikle m.9 — 7499 s.K. sonrası)
- [ ] KVKK m.11 tam 9 hak olarak listelenmiş
- [ ] Her işleme amacı m.5 veya m.6'daki bir dayanağa tekil olarak bağlanmış
- [ ] Özel nitelikli veri işleniyorsa Kurul 2018/10 sayılı kararına atıf var ve yeterli tedbirler açıklanmış
- [ ] VERBİS sicil numarası VEYA muafiyet kategorisi belirtilmiş
- [ ] Yurt dışı aktarım varsa: yeterli koruma listesi / Kurul izni / standart sözleşme / açık rıza mekanizmalarından biri somut olarak belirtilmiş
- [ ] KVKK m.13 başvuru süresi (30 gün) ve Veri Sorumlusuna Başvuru Tebliği'ne atıf var
- [ ] Saklama süreleri "gerekli olduğu sürece" gibi muğlak değil — kategori bazında somut
- [ ] Veri sorumlusu / veri işleyen ayrımı doğru kullanılmış
- [ ] Sektör bilgisi (client.industry) politikadaki veri kategorilerine yansımış
- [ ] Belge Türkçe — yabancı hukuk terminolojisi (liability, indemnification vb.) kullanılmamış
```

## Legal References (TR)

- **6698 sayılı Kişisel Verilerin Korunması Kanunu** — RG 07.04.2016, Sayı 29677
  - m.3 (tanımlar), m.4 (genel ilkeler), m.5 (işleme şartları), m.6 (özel nitelikli), m.7 (silme/yok etme/anonimleştirme), m.8 (yurt içi aktarım), m.9 (yurt dışı aktarım — 7499 s.K. ile değişik), m.10 (aydınlatma), m.11 (haklar), m.12 (veri güvenliği), m.13 (başvuru), m.14 (şikayet), m.18 (kabahatler)
- **VERBİS Yönetmeliği** — RG 30.12.2017, Sayı 30286
- **Aydınlatma Yükümlülüğü Tebliği** — RG 10.03.2018, Sayı 30356
- **Silme, Yok Etme, Anonimleştirme Yönetmeliği** — RG 28.10.2017, Sayı 30224
- **Kişisel Verileri Koruma Kurulu kararları** (31.01.2018 t. 2018/10 özel nitelikli veriler; 02.05.2019 t. 2019/125 yurt dışı aktarım)

Her atıf [mevzuat.gov.tr](https://mevzuat.gov.tr) üzerinden doğrulanmalı. Uydurma madde YASAKTIR.
