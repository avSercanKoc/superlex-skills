# Türkiye — Gizlilik Sözleşmesi (NDA) Referansları

## Temel Mevzuat

- **6098 sayılı Türk Borçlar Kanunu (TBK)** — RG 04.02.2011, Sayı 27836
- **6102 sayılı Türk Ticaret Kanunu (TTK)** — RG 14.02.2011, Sayı 27846
  - Özellikle m.54-63 (haksız rekabet — ticari sır koruması)
- **4857 sayılı İş Kanunu** (taraf çalışan ise)
- **6698 sayılı KVKK** (ifşa konusu kişisel veri içeriyorsa)
- **6100 sayılı HMK** m.412 — tahkim şartının yazılı şekli
- **4686 sayılı MTK** (Milletlerarası Tahkim Kanunu) — uluslararası tarafla NDA
- **7155 sayılı Kanun** — ticari davalarda dava şartı arabuluculuk (01.01.2019'dan itibaren)

> Tüm atıflar [mevzuat.gov.tr](https://mevzuat.gov.tr) üzerinden doğrulanmalı.

## Zorunlu Bölümler

1. **Taraflar ve tebligat adresleri**
2. **Tek taraflı (one-way) / Karşılıklı (mutual) ibaresi**
3. **Gizli Bilgi Tanımı** — kapsam ve örnekler
4. **İstisnalar** — gizli bilgi sayılmayan hâller
5. **Kullanım Amacı** — hangi proje/görüşme için paylaşılıyor
6. **Tarafların Yükümlülükleri** — koruma standardı (en az kendi benzer nitelikteki bilgilerine gösterdiği özen)
7. **Üçüncü Kişilere Aktarım Koşulları** — alt yüklenici, danışman, avukat
8. **Sürelerin Yönetimi** — sözleşme süresi + sözleşme sonrası devam eden yükümlülük süresi
9. **Bilgilerin İadesi / İmhası** — talep halinde süre
10. **Cezai Şart veya Tazminat** — TBK m.179-182 (orantılılık kritik)
11. **Fikri Mülkiyet Tahsis Etmeme** — NDA, fikri mülkiyet lisansı VERMEZ
12. **Uyuşmazlık Çözümü** — yetkili mahkeme / tahkim
13. **Uygulanacak Hukuk**
14. **Bildirim / Tebligat Usulü**
15. **Tam Anlaşma (entire agreement) / Şekil**

## Output Template (TR — Türkçe Belge İskeleti)

Agent iki bölümü birlikte üretir. Disclaimer yalnızca BÖLÜM A'nın sonuna eklenir; BÖLÜM B disclaimer almaz.

```
BÖLÜM A: GİZLİLİK SÖZLEŞMESİ

[Başlık: Gizlilik Sözleşmesi — Tek Taraflı / Karşılıklı (seçime göre)]

1. TARAFLAR
   - Açıklayan Taraf: [legal_name veya full_name], adres, temsilci
   - Alan Taraf: [counterparty.legal_name veya full_name], adres, temsilci
   (Karşılıklı ise her iki taraf da her iki rolde)

2. AMAÇ
   - Sözleşmenin amacı (belirli proje / görüşme)

3. TANIMLAR
   - Gizli Bilgi: geniş tanım + örnek liste
   - Alan Taraf / Açıklayan Taraf
   - Temsilci: alt danışman, avukat, çalışan kategorisi

4. GİZLİ BİLGİ SAYILMAYAN HÂLLER
   (Beş standart istisna — aşağıda "İstisnalar (Standart)" listesinden)

5. TARAFLARIN YÜKÜMLÜLÜKLERİ
   - Gizliliği koruma standardı (en az kendi benzer nitelikteki
     bilgilerine gösterdiği özen, her hâlükârda makul özen)
   - Sadece Amaç için kullanma
   - Temsilcilere aktarımın şartları (need-to-know + aynı gizlilik
     yükümlülüğüne tabi)
   - Adli/idari merci kararı ile ifşa halinde önceden bildirim

6. SÖZLEŞMENİN SÜRESİ VE SONRASI YÜKÜMLÜLÜK
   - Sözleşme süresi: [contract_term_months] ay
   - Gizlilik yükümlülüğü süresi: [survival_period_years] yıl
     (ticari sırlar için: TTK m.54 vd. kapsamında devam eder)

7. BİLGİLERİN İADE VEYA İMHASI
   - Açıklayan Taraf'ın yazılı talebi üzerine / sözleşme sonunda
   - [N] gün içinde iade veya imha + imha tutanağı

8. FİKRİ MÜLKİYET
   - Sözleşme, Gizli Bilgi üzerinde hiçbir mülkiyet, lisans veya
     kullanım hakkı tahsis etmez

9. CEZAİ ŞART VE TAZMİNAT  (penalty_clause == true ise)
   - Her ihlal için [amount] TL cezai şart
   - Cezai şartı aşan zararın tazmini hakkı saklıdır (ayrı fıkra)
   - TBK m.182/3'e atfen: "Hakim indirim yetkisi saklıdır" (maddi
     doğruluk; bertaraf edilemez)

10. UYGULANACAK HUKUK
    - Türk Hukuku (TBK, TTK)

11. UYUŞMAZLIK ÇÖZÜMÜ
    - [Yetkili Mahkeme: preferences.default_court]
      VEYA
    - Tahkim (HMK m.412 / MTK) — yazılı şekil sağlanmış olmalı
    - (Ticari davalarda 7155 s.K. dava şartı arabuluculuk notu)

12. TEBLİGAT
    - TTK m.18/3 tacirler arası ise: noter, KEP veya iadeli
      taahhütlü posta

13. TAM ANLAŞMA VE DEĞİŞİKLİK
    - Yazılı + imzalı değişiklik zorunlu

14. İMZA BLOĞU
    - Tarih, yer, taraf imzaları, tanık/temsilci

---
[DISCLAIMER hook: core/DISCLAIMER.md aynen eklenir, [Date] = GG.AA.YYYY]


BÖLÜM B: HUKUKÇU KONTROL LİSTESİ
(Bu bölüm sözleşme metninin PARÇASI değildir — inceleme notudur.
Sözleşmeyi karşı tarafa sunmadan önce hukukçu kontrolünden geçirin.)

- [ ] Tek taraflı / karşılıklı seçimi müvekkilin gerçek ihtiyacına
      uygun mu? (tek taraflıysa: sadece açıklayan taraf lehine mi?)
- [ ] Gizli bilgi tanımı ne çok dar ne çok geniş; örnek listesi
      müvekkilin iş konusuna uygun mu?
- [ ] Beş standart istisna eksiksiz mi? (kamuya açık, bağımsız
      geliştirme, üçüncü taraftan alma, zorunlu ifşa, rıza)
- [ ] Amaç maddesi belirsiz değil mi? Alan Taraf bunu kullanım
      yetkisi olarak yorumlayabilir mi?
- [ ] Temsilci (avukat, alt danışman) zinciri geri kapanma
      (flow-down) ile kontrol altında mı?
- [ ] Sözleşme süresi ile survival süresi AYRI tanımlı mı?
- [ ] Survival süresi yeterince uzun mu? (ticari sır niteliğinde
      bilgiler için süresiz / uzun süreli düşünüldü mü?)
- [ ] Bilgilerin iade/imha süresi uygulanabilir mi? (e-posta
      arşivi, yedekler için istisna / en iyi çaba)
- [ ] Cezai şart tutarı orantılı mı? Fahiş sayılma riski
      değerlendirildi mi? (TBK m.182/3)
- [ ] "Cezai şartı aşan zarar saklıdır" ibaresi VAR mı?
- [ ] Fikri mülkiyet tahsis etmeme ibaresi VAR mı?
- [ ] Karşı taraf çalışansa: rekabet yasağı (TBK m.444-447) ile
      karışmadığı kontrol edildi mi?
- [ ] Uyuşmazlık çözümü tutarlı mı? (hem mahkeme hem tahkim YAZILMADI)
- [ ] Tahkim varsa HMK m.412 yazılı şekil sağlandı mı?
- [ ] Tebligat usulü (TTK m.18/3 tacirler arası) net mi?
- [ ] KVKK kapsamında kişisel veri ifşası olacaksa ayrı aydınlatma
      / rıza / DPA gereksinimi değerlendirildi mi?
- [ ] İmza bloğundaki yetkili temsilci unvanı imza sirküleri ile
      uyumlu mu?
```

## Gizli Bilgi Tanımı — Denge Kuralı

- **Çok dar tanım riski:** Sızdırılan bir bilgi "tanım kapsamına girmiyor" diye koruma dışında kalabilir.
- **Çok geniş tanım riski:** Belirsizlik nedeniyle sözleşmenin bazı hükümleri TBK m.27 veya TBK m.25 (GİK) kapsamında sakat olabilir; kanıt yükü güçleşir.
- Pratik yaklaşım: genel tanım + örnek liste + açık istisnalar.

## İstisnalar (Standart)

Gizli bilgi sayılmaz:

1. Sözleşme imza tarihinde zaten kamuya açık bilgiler
2. Alıcı tarafın ihlali olmaksızın sonradan kamuya açık hâle gelen bilgiler
3. Alıcının üçüncü bir taraftan (gizlilik yükümlülüğü olmaksızın) elde ettiği bilgiler
4. Alıcının bağımsız olarak geliştirdiği bilgiler (belgeyle kanıtlanabilir)
5. Yargı, düzenleyici veya idari merci kararı ile ifşası zorunlu bilgiler (Açıklayana bildirim yükümlülüğü saklıdır)

## Cezai Şart (TBK m.179-182)

- **m.179/1:** Borçlu edimi hiç veya gereği gibi ifa etmezse, cezai şart ödeme borcu doğar.
- **m.179/2 (ifaya eklenen cezai şart):** Alacaklı hem ifayı hem de cezayı isteyebilir — SÖZLEŞMEDE AÇIK HÜKÜM GEREKİR.
- **m.180 (seçimlik cezai şart):** Borçlu cezai şart ödeyerek borcundan kurtulabilir (caiz olduğu takdirde).
- **m.182/3 — HAKİM İNDİRİMİ (EMREDİCİ):** Hakim aşırı gördüğü cezai şartı indirebilir. Taraflar bu yetkiden peşinen vazgeçemez; "hakim indirim yapamaz" ibaresi HÜKÜMSÜZDÜR.

**Pratik:** NDA'de cezai şart tutarı müvekkilin olası zararını karşılamaya yetecek ama fahiş olmayan bir seviyede tutulmalı. Ayrıca "tazmin edilmeyen fark için müvekkilin zarar talebi saklıdır" maddesi eklenmeli (cezai şart zararı sınırlamasın).

## Ticari Sır Koruması (TTK m.54-63)

Haksız rekabet hükümlerine göre ticari sırrın ifşası haksız rekabet oluşturur. NDA süresi dolsa bile ticari sır kanuni koruması devam eder (TTK m.55). NDA'de "ticari sır niteliğindeki bilgiler için TTK m.54 vd. saklıdır" tipi bir ibare eklenmesi mümkün.

## Çalışanlarla Yapılan NDA / Gizlilik Taahhütnamesi

Eğer taraflardan biri çalışansa:

- **İşçinin sadakat borcu (TBK m.396, 4857 s.K. m.25/II-e):** NDA'den bağımsız olarak yasal çerçevede vardır. İşçinin iş sırasında öğrendiği ticari sırları iş sonrası da açıklamama yükümlülüğü vardır.
- **Rekabet yasağı (TBK m.444-447) ≠ gizlilik yükümlülüğü:**
  - Rekabet yasağı işçinin çalışma hürriyetini sınırlar (yer, süre, konu sınırlaması zorunlu; m.445)
  - Gizlilik bilgiyi koruma yükümlülüğüdür; işçi rakipte çalışsa bile gizli bilgiyi açıklayamaz
  - Bu iki kurumu aynı maddede karıştırmak sözleşmenin geçerliliğini riske atar

## Süreler

İki ayrı süre yönetimi:

- **Sözleşme süresi (term):** NDA'nin kendi hükümlerinin yürürlükte olduğu süre
- **Gizlilik yükümlülüğü süresi (survival):** Sözleşme sona erse bile gizlilik koruması devam etmeli (tipik: 2-5 yıl; ticari sırlar için süresiz mümkün)

Sürelerin ayrıştırılmadığı NDA hukuki koruma boşluğu yaratır.

## Üçüncü Kişi İfşaları

NDA ifşayı zorunlu kılan adli / idari kararları istisna tutar, ancak:

- Alıcı, ifşadan önce açıklayana yazılı bildirim yapmalı (zaman imkanı varsa)
- Alıcı, ifşa kapsamını sınırlamak için makul hukuki yolları kullanmalı
- "Gizlilik koruma kararı" (protective order) talep etmeye çalışmalı

## Uyuşmazlık Çözümü

- **Yetkili mahkeme:** HMK m.17-19 kapsamında tayin; tacirler arası ise yetki sözleşmesi geçerli (HMK m.17)
- **Tahkim:** HMK m.412 uyarınca yazılı şekil zorunlu. Uluslararası tahkim için 4686 s. MTK
- **Arabuluculuk:** 6325 s.K.; bazı ticari uyuşmazlıklar için dava şartı (7155 s.K. ile ticari davalarda dava şartı arabuluculuk — 01.01.2019)

## Post-Generation HARD-GATE Template (TR)

```
Bu NDA'da aşağıdaki maddeler en yüksek riskli kısımlardır:

1. [Cezai Şart (Md. 9)] — Risk: Tutar [amount] TL; TBK m.182/3
   uyarınca hakim indirim yetkisi vardır, fahişse indirilebilir.
   Ayrıca 'cezai şartı aşan zarar saklıdır' ibaresi eklendi —
   bu koruma mı yeterli, yoksa cezai şart + tazminat birlikte
   mi tercih edilsin?
   💡 Alternatif: ifa + ceza (m.179/2) formülü

2. [Survival Süresi (Md. 6)] — Risk: [survival_period_years] yıl
   ticari sırlar için yetersiz olabilir. Ticari sır TTK m.54 vd.
   ile süresiz korunur ancak sözleşmesel süre darsa kanıt yükü
   zorlaşır.
   💡 Alternatif: "Ticari sır niteliğindeki bilgiler süresiz
   gizlidir" ibaresi

3. [Tek Taraflı / Karşılıklı Seçim] — Risk: [mevcut seçim]; eğer
   müvekkil hem açıklayacak hem alacaksa karşılıklı olmalı; aksi
   halde müvekkilin açıkladığı bilgiler korunur ama aldığı
   bilgiler için kendi yükümlülüğü belirsiz kalır.
   💡 Alternatif: [seçimin tersine dönüştürülmesi]

Ayrıca BÖLÜM B kontrol listesindeki maddeleri ayrı ayrı teyit
etmenizi öneririm. Hangi maddeyi detaylandırayım?
```

Kullanıcı onayı alınmadan belge TESLİM EDİLMEZ.

## Jurisdiction-Specific Anti-Patterns (TR)

- ❌ "Hakim indirim yapamaz" veya benzeri TBK m.182/3'ü bertaraf eden madde
- ❌ Cezai şart varken "cezai şartı aşan zarar saklıdır" ibaresini unutmak (cezai şart zararı sınırlar)
- ❌ Rekabet yasağı ile gizliliği karıştırmak (TBK m.444-447 çerçevesi gerekir)
- ❌ Çalışan olan karşı taraf için NDA yazarken 4857 s.K. + TBK m.396 sadakat borcu çerçevesini görmezden gelmek
- ❌ Tahkim şartında HMK m.412 yazılı şekli kontrol etmeden geçerlilik varsaymak
- ❌ KVKK trigger'ı olan ifşalarda (kişisel veri paylaşımı) ayrı aydınlatma / rıza / DPA ihtiyacını atlamak
- ❌ Gizli bilgi tanımını sözleşmenin geçerliliğini tartışmalı hale getirecek kadar geniş tutmak (TBK m.27 hükümsüzlük riski)
- ❌ Fikri mülkiyet lisansı vermeme ibaresinin eksik bırakılması (alan taraf ima lisans iddiası geliştirebilir)
- ❌ Sözleşme süresi ile survival süresini birleştirmek (koruma boşluğu)
- ❌ Tacirler arası NDA'de tebligat şeklini TTK m.18/3'e uydurmamak

## Jurisdiction-Specific SELF-TEST (TR)

```
- [ ] Tek taraflı / karşılıklı format kullanıcı tercihiyle uyumlu
- [ ] Gizli bilgi tanımı TBK m.27 hükümsüzlük riskinden uzak; genel + örnek + istisna yapısı uygulanmış
- [ ] Beş standart istisna eksiksiz
- [ ] Amaç maddesi belirli bir proje / görüşme için
- [ ] Temsilci aktarımında need-to-know + flow-down
- [ ] Sözleşme süresi VE survival süresi ayrı, sayısal
- [ ] Cezai şart varsa: tutar belirli + TBK m.182/3 hakim indirimi saklı bilinciyle yazılmış + "cezai şartı aşan zarar saklıdır" ibaresi eklenmiş
- [ ] Fikri mülkiyet lisansı vermeme ibaresi var
- [ ] Karşı taraf çalışansa: kullanıcıya TBK m.444-447 rekabet yasağı ayrımı uyarısı verildi
- [ ] Uyuşmazlık çözümü: mahkeme VEYA tahkim (ikisi birden değil); tahkim ise HMK m.412 yazılı şekil var
- [ ] Tacirler arası ise tebligat TTK m.18/3 formatında
- [ ] KVKK check: kişisel veri ifşa söz konusuysa kullanıcıya ayrı aydınlatma/rıza gereksinimi hatırlatıldı
- [ ] İmza bloğu authorized_signatory ile uyumlu
- [ ] BÖLÜM A'nın sonuna core/DISCLAIMER.md eklendi, [Date] dolduruldu
- [ ] BÖLÜM B (kontrol listesi) sözleşmenin parçası değil, ayrı ve belirgin olarak işaretlenmiş
```

## Kontrol Listesi Şablonu (Hukukçu için — PART B özü)

Bu liste BÖLÜM B'de kullanıcıya iletilen öz rehberdir:

- [ ] Tek taraflı / karşılıklı NDA doğru formatta mı?
- [ ] Gizli bilgi tanımı ne çok dar ne çok geniş
- [ ] Beş standart istisna eksiksiz
- [ ] Kullanım amacı net tanımlı (sadece belirli proje için)
- [ ] Üçüncü kişi paylaşımı koşullu (need-to-know, geri kapanma yükümlülüğü)
- [ ] Sözleşme süresi + survival süresi ayrı tanımlı
- [ ] Bilgilerin iade/imha prosedürü + süre
- [ ] Cezai şart tutarı orantılı; TBK m.182/3 indirim notu eklendi
- [ ] "Cezai şartı aşan zarar saklıdır" ibaresi var
- [ ] Fikri mülkiyet lisansı vermeme ibaresi var
- [ ] Çalışanlarla ise TBK m.444-447 rekabet yasağı ile karışmış mı kontrolü
- [ ] Uyuşmazlık çözümü (mahkeme / tahkim / arabuluculuk) net
- [ ] Tahkim varsa HMK m.412 yazılı şekil sağlandı
- [ ] Tebligat adresleri (TTK m.18/3 tacirler arası şekil)
- [ ] KVKK kapsamında kişisel veri ifşası varsa çapraz referans eklendi

## Legal References (TR)

- **6098 sayılı TBK** — RG 04.02.2011, Sayı 27836
  - m.179-182 (cezai şart, m.182/3 hakim indirimi)
  - m.396 (işçinin sadakat borcu, taraf çalışansa)
  - m.444-447 (rekabet yasağı — karışmaması gereken kurum)
- **6102 sayılı TTK** — RG 14.02.2011, Sayı 27846
  - m.18/3 (tacirler arası tebligat şekli)
  - m.54-63 (haksız rekabet — ticari sır koruması)
- **4857 sayılı İş Kanunu** — m.25/II-e (sadakate aykırılık)
- **6100 sayılı HMK** — m.412 (tahkim şartı yazılı şekil)
- **4686 sayılı MTK** (Milletlerarası Tahkim Kanunu) — uluslararası tarafla NDA
- **7155 sayılı Kanun** — ticari davalarda dava şartı arabuluculuk (01.01.2019)
- **6698 sayılı KVKK** — kişisel veri ifşasında çapraz referans

Her atıf [mevzuat.gov.tr](https://mevzuat.gov.tr) üzerinden doğrulanmalı. Uydurma madde YASAKTIR.
