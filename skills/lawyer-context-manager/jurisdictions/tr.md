# Türkiye — Lawyer Context Manager Yerel Ayarları

> Bu dosya `skills/lawyer-context-manager/SKILL.md` tarafından yüklenir. `SKILL.md` soyut ve İngilizce şemayı tanımlar; bu dosya Türkiye'ye özgü varsayılanları, yer tutucu adlarını, özet şablonunu, Türkçe HARD-GATE istemini ve KVKK dayanaklarını içerir.

## Temel Mevzuat

- **6698 sayılı Kişisel Verilerin Korunması Kanunu (KVKK)** — RG 07.04.2016, Sayı 29677
  - m.4/1-ç: Veri minimizasyonu ilkesi — işlendikleri amaçla bağlantılı, sınırlı ve ölçülü olma
  - m.5: Kişisel verilerin işlenme şartları (açık rıza veya hukuki sebep)
- **Aydınlatma Yükümlülüğünün Yerine Getirilmesinde Uyulacak Usul ve Esaslar Hakkında Tebliğ** — RG 10.03.2018, Sayı 30356
- **1136 sayılı Avukatlık Kanunu** — avukat-müvekkil ilişkisi ve sır saklama yükümlülüğü (m.36)

> Tüm referanslar [mevzuat.gov.tr](https://mevzuat.gov.tr) üzerinden doğrulanmalıdır.

## Preference Defaults (TR)

| Alan | Varsayılan |
|------|------------|
| `default_governing_law` | Türk Hukuku |
| `default_court` | (kullanıcı seçer — ör. "İstanbul Anadolu Mahkemeleri ve İcra Daireleri") |
| `default_language` | Türkçe |
| `date_format` | `GG.AA.YYYY` |
| `currency` | TRY |
| `formality_level` | `formal` |

## Sensitive-Identifier Placeholders (TR)

Bu yer tutucular şema içinde ham kimlik bilgilerinin yerine KULLANILIR. Ajan, bunları hiçbir koşulda ham veriyle doldurmaz; hukukçu son belgede elle doldurur.

| Yer tutucu | Yerine geçtiği | Dayanak |
|------------|----------------|---------|
| `[TCKN_PLACEHOLDER]` | T.C. Kimlik Numarası | KVKK m.4/1-ç |
| `[PASAPORT_PLACEHOLDER]` | Pasaport numarası | KVKK m.4/1-ç |
| `[HESAP_NO_PLACEHOLDER]` | Banka hesap / IBAN | KVKK m.4/1-ç |
| `[VERGI_NO_PLACEHOLDER]` | Kimlik doğrulama için kullanılan vergi no | KVKK m.4/1-ç |

Ek alanlar (MERSİS numarası, ticaret sicil numarası, vergi dairesi) ham veri olarak saklanabilir; bunlar KVKK anlamında özel nitelikli veri değildir ve ticaret sicilinden zaten aleniyken erişilebilir.

## Corporate Registry Field (TR)

`company_registry_id` alanı `tr` bağlamında **MERSİS numarası** olarak toplanır. Şablonlarda bu değer doğrudan görünür; yer tutucu kullanılmaz.

## Summary Template (TR)

`default_language = Türkçe` olduğu için özet Türkçe üretilir. `SKILL.md` → Output Specification sıralamasına birebir karşılık gelir.

```
📋 BAĞLAM BİLGİLERİ (Context Snapshot)

Müvekkil Türü       : [individual → Gerçek Kişi | corporate → Tüzel Kişi]
Ad / Unvan          : [full_name | legal_name]
Adres               : [residential_address | registered_address]
Sektör              : [industry]                 (varsa)
Yetkili Mahkeme     : [preferences.default_court]
Uygulanacak Hukuk   : [preferences.default_governing_law]
Belge Dili          : [preferences.default_language]
Avukat / Büro       : [attorney_name] / [firm_name]   (varsa)

Bu bilgiler [GG.AA.YYYY HH:MM] itibarıyla dondurulmuştur.
Değişiklik yapmak isterseniz 'bağlamı güncelle' (veya 'update context') komutunu kullanın.
Bağlamı taşınabilir bir dosyaya kaydetmek isterseniz 'snapshot ver' (veya 'export context') komutunu kullanın.
```

## Freeze Line (TR)

Her özet çıktısının en alt üç satırı **kelimesi kelimesine** şunlar olmalıdır:

```
Bu bilgiler [GG.AA.YYYY HH:MM] itibarıyla dondurulmuştur.
Değişiklik yapmak isterseniz 'bağlamı güncelle' (veya 'update context') komutunu kullanın.
Bağlamı taşınabilir bir dosyaya kaydetmek isterseniz 'snapshot ver' (veya 'export context') komutunu kullanın.
```

Zaman damgası `preferences.date_format` ile biçimlendirilir.

## Post-Generation HARD-GATE Template (TR)

Özet gösterildikten sonra ajan mutlaka Türkçe olarak şunu sorar:

```
Yukarıdaki bağlam bilgileri doğru mu? Herhangi bir alanı değiştirmek veya
eksik alan (ör. avukat adı, yetkili mahkeme, sektör) eklemek ister misiniz?

- Onaylıyorsanız: 'onay' yazmanız yeterlidir; tetikleyen skill'e devam ediyorum.
- Değişiklik isterseniz: lütfen değiştirilmesini istediğiniz alanı ve yeni değeri belirtin.
- Yeni bir bağlama geçmek isterseniz: 'bağlamı güncelle' yazın.

Onayınız alınmadan bağlam DONDURULMUŞ sayılmaz ve devam edilmez.
```

Kullanıcı açık onay vermeden hiçbir alt skill çağrılmaz, hiçbir belge üretilmez.

## Export Command Phrases (TR)

Aşağıdaki tetikleyici ifadelerden herhangi biri **export akışını** başlatır:

- `snapshot ver`
- `snapshot dışa aktar`
- `bağlamı dışa aktar`
- `bağlamı kaydet`
- `context ver`
- `export context`
- `save my context`
- `save snapshot`

Kullanıcı tek kelimelik `snapshot` ya da `export` derse ajan, niyeti doğrulamak için "export mu yoksa import mu?" diye **mutlaka** netleştirir.

## Import Command Phrases (TR)

Aşağıdaki tetikleyici ifadelerden herhangi biri **import akışını** başlatır:

- `snapshot yükle`
- `snapshot içe aktar`
- `bağlamı içe aktar`
- `bağlamı yükle`
- `load snapshot`
- `import context`
- `use this snapshot`

Kullanıcı chat'e bir `lex-snapshot-*.json` dosyası iliştirdiğinde veya bir dosya yolundan bahsettiğinde (örn. `./lex-snapshot-acme.json`) ajan import akışını **açıkça teyit alarak** başlatır.

## Export Confirmation (TR)

Ajan, JSON dosyasını yazmadan önce mutlaka Türkçe olarak şunu gösterir:

```
📤 Snapshot dışa aktarılacak — son kontrol

Dosya adı     : lex-snapshot-{slug}.json
Hedef yol     : {absolute_path}
İçerik özeti  :
  - Müvekkil      : {full_name | legal_name}  ({client_type})
  - Adres         : {residential_address | registered_address}
  - Sektör        : {industry}                (varsa)
  - Tüm büro ve tercih alanları yukarıdaki özetle aynıdır.
  - Hassas kimlik alanları yer tutucu olarak yazılacaktır:
    [TCKN_PLACEHOLDER] / [PASAPORT_PLACEHOLDER] / [HESAP_NO_PLACEHOLDER]

⚠️ UYARI — KVKK m.4/1-ç ve Av.K. m.36 gereği:
- Bu dosya müvekkil verisi içerir. Onu her müvekkil dosyası gibi koruyun.
- Dosya `.gitignore` ile repodan dışlanmıştır; commit / push ETMEYİN.
- Dosyayı yalnızca güvendiğiniz ortamlarda paylaşın.

Yazmaya onay veriyor musunuz?
- 'onay' yazın → dosya yazılsın
- 'hayır' / 'iptal' → dışa aktarma durdurulsun
- Dosya adını veya yolunu değiştirmek isterseniz belirtin
```

Kullanıcı açık onay vermeden dosya YAZILMAZ.

Dosya yazıldıktan sonra ajan şu bildirimi gösterir:

```
✅ Snapshot yazıldı.

Yol           : {absolute_path}
Boyut         : {bytes} bayt
İçe aktarmak için yeni bir chat'te şu komutu kullanabilirsiniz:
  'snapshot yükle {file_name}'

Bu dosyayı müvekkil dosyalarınızla birlikte saklamanızı öneririz.
```

## Import Confirmation (TR)

Ajan, JSON dosyasını şemaya göre doğruladıktan SONRA, snapshot'ı benimsemeden ÖNCE mutlaka şunu gösterir:

```
📥 Snapshot içe aktarılacak — son kontrol

Dosya         : {file_path}
Şema sürümü   : {schema_version}
Oluşturulma   : {frozen_at_formatted}   ({age} önce)
Yargı alanı   : {jurisdiction_in_file}   {✅ aktif yargı alanıyla aynı | ⚠️ aktif yargı alanı farklı: {active}}

İçerik özeti — aktif yargı alanının dilinde render edildi:
{rendered_summary_tr}

⚠️ DİKKAT:
- Snapshot {age} önce donduruldu. O tarihten bu yana müvekkil bilgileri değişmiş olabilir.
- Yargı alanı uyuşmazsa, yerel mevzuat referansları (KVKK, TBK, TTK) uygulanmayabilir.
- Bu snapshot'ın mevcut iş için hâlâ doğru olduğunu teyit etmek SİZİN sorumluluğunuzdadır.

İçe aktarmayı onaylıyor musunuz?
- 'onay' → snapshot mevcut oturum bağlamı olarak benimsensin, yeni bir zaman damgasıyla yeniden dondurulsun
- 'hayır' / 'iptal' → snapshot kullanılmasın, sıfırdan toplamaya devam edilsin
- Dosyada hata gördüyseniz: 'güncelle' deyip doğru alanı belirtin (önce import, sonra değişiklik yapılır)
```

Kullanıcı açık onay vermeden snapshot BENİMSENMEZ.

Şema doğrulaması başarısız olursa ajan şu mesajı verir ve import'u ANINDA durdurur:

```
❌ Snapshot içe aktarılamadı.

Dosya          : {file_path}
Hata           : {schema_error}
Beklenen kayıt : skills/lawyer-context-manager/snapshot.schema.json

Dosyanın elle değiştirildiğinden şüpheleniyorsanız, özgün snapshot'ı kullanın
veya sıfırdan 'bağlamı güncelle' komutuyla yeni bir bağlam oluşturun.
```

## Jurisdiction-Specific Anti-Patterns (TR)

- ❌ Ham TCKN, pasaport numarası veya IBAN'ı snapshot içinde saklamak (KVKK m.4/1-ç — veri minimizasyonu)
- ❌ Ham TCKN'yi bir belge taslağına yerleştirmek yerine `[TCKN_PLACEHOLDER]` kullanmamak
- ❌ Aşağı akış skill'i talep etmediği halde MERSİS / vergi numarası / ticaret sicil numarası istemek
- ❌ Müvekkilin sektör bilgisini (privacy-policy ve terms-of-use için kritik) uydurmak
- ❌ `default_governing_law` Türk Hukuku iken çıktıyı İngilizce üretmek (kullanıcı açıkça talep etmedikçe)
- ❌ Mülga 5237 öncesi TCK veya mülga 818 s.K. BK'ya atıf yapmak
- ❌ Snapshot üzerinde kullanıcı talimatı olmadan sessizce değişiklik yapmak
- ❌ Avukat-müvekkil sır saklama yükümlülüğüne (Av.K. m.36) aykırı biçimde müvekkil verisini dış çıktıya sızdırmak
- ❌ **`lex-snapshot-*.json` dosyasını repo içine commit etmek, push etmek veya bir bulut hizmetine yüklemek** (müvekkil verisi — Av.K. m.36)
- ❌ **Export sırasında ham TCKN / pasaport / IBAN'ı JSON'a yazmak** (bellekte placeholder varsa dosyada da placeholder olmalı — KVKK m.4/1-ç)
- ❌ **Export onayı alınmadan dosya yazmak**
- ❌ **Varolan bir `lex-snapshot-*.json` dosyasının üzerine onay almadan yazmak**
- ❌ **Import'u HARD-GATE olmadan, sessizce benimsemek**
- ❌ Import edilen dosyanın yargı alanı aktif yargı alanından farklıyken uyarı göstermemek
- ❌ Import edilen alanları, mevcut oturumda kullanıcının doldurduğu alanlarla aynı turda karıştırmak (ya hep ya hiç benimseme)
- ❌ Import edilen snapshot'ı, orijinal `frozen_at` değerini `meta.imported_from_frozen_at`'e taşımadan yeni zaman damgasıyla ezmek

## Jurisdiction-Specific SELF-TEST (TR)

`SKILL.md` → Fact-Check Protocol içindeki genel listeye ek olarak:

Toplama / özet:
- [ ] Ham TCKN / pasaport / IBAN yerine `[TCKN_PLACEHOLDER]` / `[PASAPORT_PLACEHOLDER]` / `[HESAP_NO_PLACEHOLDER]` kullanılmıştır
- [ ] `default_governing_law` değeri "Türk Hukuku" olarak tutulmuştur (kullanıcı aksini açıkça talep etmedikçe)
- [ ] `default_language` değeri "Türkçe" ve özet Türkçe üretilmiştir
- [ ] `date_format` `GG.AA.YYYY` biçimindedir ve dondurma satırı bu biçimle yazılmıştır
- [ ] Currency değeri `TRY` olarak tutulmuştur (kullanıcı aksini açıkça talep etmedikçe)
- [ ] `company_registry_id` alanı toplanacaksa MERSİS numarası olarak etiketlenmiştir
- [ ] Dondurma satırındaki üç cümle kelimesi kelimesine Freeze Line (TR) bölümündeki gibidir (güncelleme + export komut satırı dahil)
- [ ] Post-Generation HARD-GATE Türkçe ve bu dosyadaki şablonla uyumlu biçimde sorulmuştur
- [ ] KVKK m.4/1-ç gereği aşağı akış skill'i talep etmeyen hiçbir opsiyonel hassas alan istenmemiştir

Export:
- [ ] Dosya adı `lex-snapshot-<slug>.json` kuralına uyar, Türkçe karakterler ASCII slug'a (ör. `ş`→`s`, `ğ`→`g`, `ı`→`i`) dönüştürülmüştür
- [ ] Export Confirmation (TR) ekranı gösterildi ve kullanıcıdan açık onay alındı
- [ ] Bellekte yer tutucu olan her alan (`[TCKN_PLACEHOLDER]` vb.) JSON'da da yer tutucu olarak yazılmıştır
- [ ] Dosya varsayılan olarak çalışma dizinine yazıldı; mutlak yol verildiyse kullanıcı açıkça istedi
- [ ] Yazma sonrası bildirimi (yol + byte + gizlilik hatırlatması) gösterildi
- [ ] JSON çıktısı `skills/lawyer-context-manager/snapshot.schema.json` şemasına uyar

Import:
- [ ] Şema doğrulaması BAŞARILI olmadan benimseme yapılmadı
- [ ] `kind == "lex-snapshot"` ve `schema_version` desteklenen bir sürümdür
- [ ] Dosyadaki `jurisdiction` aktif yargı alanıyla karşılaştırıldı; uyuşmazsa Import Confirmation (TR) ekranında açıkça uyarıldı
- [ ] Import Confirmation (TR) ekranı gösterildi ve kullanıcıdan açık onay alındı
- [ ] Benimseme sırasında orijinal `frozen_at` değeri `meta.imported_from_frozen_at`'e taşındı, üst seviye `frozen_at` güncel zaman damgasıyla yenilendi
- [ ] Import edilen alanlar, mevcut oturumda kullanıcının aynı turda girdiği alanlarla KARIŞTIRILMADI

## Legal References (TR)

- KVKK m.4/1-ç (veri minimizasyonu), m.5 (işleme şartları)
- Aydınlatma Yükümlülüğü Tebliği (RG 10.03.2018)
- 1136 s. Avukatlık Kanunu m.36 (sır saklama)

> Referanslar yalnızca ajan mantığının dayanağıdır; özet çıktısı içine yazılmaz. Aşağı akış skill'leri (privacy-policy, terms-of-use vb.) KVKK alıntılarını kendi çıktılarında yapar.
