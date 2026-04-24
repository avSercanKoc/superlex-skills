# Türkiye — Skill Yazma Kılavuzu (TR)

> Bu dosya `skills/writing-lex-skills/SKILL.md` tarafından aktif yetki alanı `tr`
> olarak çözümlendiğinde yüklenir. Motor soyuttur; Türkçe çalışma dili talimatları,
> baskı testi şablonları ve katkı notları burada bulunur.

## Çekirdek Mevzuat ve Yetkili Kaynaklar

Bu skill hukuki belgeler üretmez — yeni skill'ler üretir. Yetki alanına özgü
bir mevzuat atıfı gerekmez. Aşağıdaki kaynaklar referans niteliğindedir:

- [resmigazete.gov.tr](https://www.resmigazete.gov.tr) — tüm kanun ve yönetmelik doğrulama
- [mevzuat.gov.tr](https://www.mevzuat.gov.tr) — konsolide mevzuat metinleri
- [lexpera.com.tr](https://www.lexpera.com.tr) — Yargıtay kararları ve içtihat

## Özet Şablonu

Bu skill bir hukuki belge değil, yeni bir Lex-Skill becerisi üretir.

```
Üretilen: skills/<skill-adı>/SKILL.md (Motor)
          skills/<skill-adı>/jurisdictions/tr.md (Yakıt)
Kanıt:    docs/pressure-tests/YYYY-AA-GG-<skill-adı>.md
```

## Üretim Sonrası HARD-GATE Şablonu

## Post-Generation HARD-GATE Template (TR)

<HARD-GATE phase="post-generation" tier="🟢">
PR'ı göndermeden önce lütfen şunları doğrulayın:

**Motor kontrolü:**
- SKILL.md'de hiçbir kanun maddesi numarası yok mu? ✓/✗
- SKILL.md'de hiçbir Türkçe başlık veya etiket yok mu? ✓/✗
- 12 zorunlu bölümün tamamı doğru sırada mevcut mu? ✓/✗

**Yakıt kontrolü (jurisdictions/tr.md):**
- Her atıfta bulunulan madde Resmî Gazete'de doğrulandı mı? ✓/✗
- Çıktı şablonu Türkçe mi? ✓/✗
- HARD-GATE ve SELF-TEST metinleri Türkçe mi? ✓/✗

**Guardian:**
- `npm run validate:strict` sıfır hata + sıfır uyarıyla çıktı mu? ✓/✗

**Baskı testleri:**
- 3 senaryo (aceleci / otorite / belirsizlik) geçti mi? ✓/✗
- Oturum günlüğü `docs/pressure-tests/` altında mı? ✓/✗

**Ruh vs Harf:** Kuralların harfini çiğnemek, ruhunu çiğnemektir.
Kısayolları mantıkla savunmayın.
</HARD-GATE>

## Jurisdiction-Specific Anti-Patterns

- ❌ SKILL.md'ye TBK, TTK, KVKK vb. madde numarası eklemek — Motor kirlenmiş olur
- ❌ jurisdictions/tr.md'yi İngilizce yazmak — Türkçe çalışma dili zorunluluğunu ihlal eder
- ❌ Mevzuatı Resmî Gazete'de doğrulamadan atıfta bulunmak — uydurma hüküm sayılır
- ❌ "Muhtemelen hâlâ geçerlidir" diyerek kanun maddesini yerleştirmek — "muhtemelen" uydurma üretir

## Jurisdiction-Specific SELF-TEST

- [ ] SKILL.md'nin gövdesinde Türkçe sözcük veya kanun maddesi yok
- [ ] jurisdictions/tr.md tamamen Türkçe yazılmış
- [ ] Tüm kanun atıfları resmigazete.gov.tr veya mevzuat.gov.tr üzerinden doğrulandı
- [ ] HARD-GATE prompt metni Türkçe yazılmış ve yüksek riskli içerik için zorunlu hale getirilmiş
- [ ] Çıktı şablonundaki başlıklar Türkçe

## Legal References

- [Anayasa (1982)](https://www.mevzuat.gov.tr/mevzuatmetin/1.5.2709.pdf) — temel haklar çerçevesi
- [Resmî Gazete](https://www.resmigazete.gov.tr) — kanun doğrulama birincil kaynağı
- [mevzuat.gov.tr](https://www.mevzuat.gov.tr) — konsolide mevzuat metinleri
