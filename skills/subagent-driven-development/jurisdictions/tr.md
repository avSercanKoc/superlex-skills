# Jurisdiction: tr (Turkish Law)
# Skill: subagent-driven-development

## Output Template

Orkestrasyon özeti için standart şablon:

```markdown
# Alt-Ajan İş Akışı Özeti

**Durum:** [TÜMÜ_TAMAMLANDI | KULLANICI_MÜDAHALESİ_BEKLİYOR]

## Görev Listesi
1. [Görev Adı] — Durum: [DONE | DONE_WITH_CONCERNS | BLOCKED | NEEDS_CONTEXT]
2. ...

## Açık Endişeler ve Çözülemeyen Engeller
- [Eğer varsa DONE_WITH_CONCERNS veya BLOCKED açıklamaları]

## Entegre Taslak
[Alt-ajanların çıktılarının birleştirilmiş hali — her bir çıktının kendi FERAGATNAMESİ (DISCLAIMER) korunmalıdır]
```

## Pre-Generation HARD-GATE Template

```markdown
<HARD-GATE phase="pre-generation">
**Alt-Ajan Orkestrasyonu Ön Onayı**

Çoklu alt-ajan iş akışını başlatmadan önce aşağıdaki hususları onaylamanız gerekmektedir:

1. Görev planı ve kabul kriterleri nettir.
2. `lawyer-context-manager` tarafından sağlanan müvekkil/taraf bağlamı (snapshot) günceldir ve tüm alt-ajanlara aktarılacaktır.
3. Görevlerin tabi olduğu hukuk sistemi (ör. Türk Hukuku) belirgindir.

Onaylıyor musunuz? (Evet / Hayır)
</HARD-GATE>
```

## Post-Generation HARD-GATE Template

```markdown
<HARD-GATE phase="post-generation">
**Alt-Ajan Orkestrasyonu Sonuç ve Teslim Onayı**

Tüm görevler işlenmiştir. Entegre belgeyi teslim etmeden önce aşağıdaki durumu onaylamanız gerekmektedir:

**Durum Özeti:**
- [X] görev başarıyla (DONE) tamamlandı.
- [Y] görevde endişeler (DONE_WITH_CONCERNS) bildirildi: [Endişeleri Listeleyin]
- [Z] görev bloke oldu (BLOCKED / NEEDS_CONTEXT): [Nedeni Listeleyin]

Tüm tamamlanan görevler Uyum (Compliance) ve Kalite (Quality) denetimlerinden geçmiştir.

Yukarıdaki açık uçlu hususları ve entegre metni bu haliyle onaylıyor musunuz? (Evet / Hayır)
</HARD-GATE>
```

## Jurisdiction-Specific Anti-Patterns

- ❌ Türk Hukuku (tr) bağlamında çalışan alt-ajanlara eksik yetki vermek veya İngilizce revizyon/yazım yaptırmak (Çıktılar tamamen Türkçe olmalıdır).
- ❌ Alt-ajanların her birine "KVKK" ve "GDPR" görevlerini karıştırarak vermek (bir ajan tek bir rejime odaklanmalıdır).
- ❌ Alt-ajanların kendi ürettikleri belgelere feragatname (disclaimer) eklemelerini engellemek veya orkestratörün bu feragatnameleri silerek birleştirmesi.

## Jurisdiction-Specific SELF-TEST

```markdown
<SELF-TEST>
Türk Hukuku adaptasyonu için doğrula:
- [ ] Türkçe `Pre-Generation` ve `Post-Generation` HARD-GATE metinleri kullanıcıya eksiksiz sunuldu.
- [ ] Entegre belge Türkçedir ve yabancı hukuk sistemlerine (ör. GDPR, EU Law) ait kavramlar (eğer görev özel olarak bunu gerektirmiyorsa) içermez.
- [ ] `DONE_WITH_CONCERNS` durumundaki her bir Türk Hukuku çekincesi (ör. Yargıtay içtihadı uyumsuzluğu şüphesi) Post-Generation HARD-GATE'te kullanıcıya açıkça listelendi.
</SELF-TEST>
```

## Legal References

Bu orkestrasyon skill'i bizzat hukuki metin üretmez ve mevzuat maddesi uygulamaz. Alt-ajanların (drafter) kullandığı ilgili skill'in `jurisdictions/tr.md` dosyasındaki hukuki referanslar geçerlidir.
