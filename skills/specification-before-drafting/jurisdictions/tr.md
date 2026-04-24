# Jurisdiction: tr (Turkish Law)
# Skill: specification-before-drafting

## Output Template

Bu skill nihai bir sözleşme metni değil, hukuki bir şartname/spesifikasyon dokümanı üretir.

```markdown
# Hukuki Strateji ve Spesifikasyon Belgesi
**Tarih:** [Tarih]
**Konu:** [Dokümanın Konusu]
**İlgili Mevzuat:** Türk Hukuku (Özellikle [İlgili Kanunlar])

## 1. Kapsam ve Amaç
[Müvekkilin asıl amacı ve belgenin sınırları]

## 2. Taraflar ve Roller
[Kim kime karşı ne taahhüt ediyor?]

## 3. Seçilen Hukuki Yaklaşım ve Gerekçesi
[Önerilen alternatifler arasından kullanıcının (avukatın) seçtiği yaklaşım ve neden diğerlerinin elendiği]

## 4. Temel Mekanizmalar ve Riskler
- **Mekanizma A:** [Açıklama] (Risk: [Risk])
- **Mekanizma B:** [Açıklama] (Risk: [Risk])

## 5. Çözümlenmemiş Konular / Açık Uçlar
[TBD (To Be Determined) veya taslak sırasında netleşecek hususlar]
```

## Pre-Generation HARD-GATE Template

```markdown
<HARD-GATE phase="pre-generation">
**Strateji Onayı Gerekiyor**

Taslak metni (drafting) oluşturmaya BAŞLAMADAN önce, yukarıda sunduğum hukuki strateji ve alternatif yaklaşımları onaylamanız gerekmektedir. 

"Bu basit bir standart sözleşmedir" varsayımıyla hareket edemem. Lütfen önerdiğim yaklaşımlardan hangisiyle ilerlemek istediğinizi onaylayın veya değişiklik talep edin.
</HARD-GATE>
```

## Post-Generation HARD-GATE Template

```markdown
<HARD-GATE phase="post-generation">
**Spesifikasyon Belgesi İnceleme Onayı**

Hukuki spesifikasyon ve strateji belgesi oluşturuldu ve `docs/legal-specs/` dizinine kaydedildi.

Lütfen bu belgeyi inceleyin. Eğer kapsam ve strateji beklentilerinizi tam olarak karşılıyorsa, asıl sözleşme taslağını oluşturmak üzere Drafting aşamasına (ör. subagent-driven-development) geçmek için onay verin. (Evet / Hayır / Değişiklik İste)
</HARD-GATE>
```

## Jurisdiction-Specific Anti-Patterns

- ❌ **Kestirip Atma (Dismissiveness):** Kullanıcı "Bana hızlıca standart bir gizlilik sözleşmesi (NDA) yaz" dediğinde, strateji aşamasını atlayıp hemen madde madde yazmaya başlamak. (Türk Hukukunda "standart" ceza şartı diye bir şey yoktur, her durumun tacir olup olmama gibi dinamikleri vardır).
- ❌ **Amerikan/İngiliz Hukuku Konseptlerini Önerme:** Alternatif stratejiler sunarken Türk Borçlar Kanunu veya TTK'da yeri olmayan Anglo-Sakson konseptlerini (örn. "Consideration", "Punitive Damages") geçerli bir alternatifmiş gibi sunmak.

## Jurisdiction-Specific SELF-TEST

```markdown
<SELF-TEST>
Türk Hukuku adaptasyonu için doğrula:
- [ ] Sunulan alternatif stratejiler (yaklaşımlar) Türk Borçlar Kanunu, TTK veya ilgili Türk mevzuatıyla tamamen uyumlu mu?
- [ ] "Standart sözleşme" bahanesiyle doğrudan taslağa geçilmediği doğrulandı mı?
- [ ] Pre-Generation ve Post-Generation HARD-GATE metinleri kullanıcıya eksiksiz olarak Türkçe sunuldu mu?
</SELF-TEST>
```

## Legal References

Bu strateji belirleme yeteneği, henüz taslak üretmediği için doğrudan spesifik madde atıfları yapmak zorunda değildir. Ancak strateji alternatifleri tartışılırken (örneğin; cezai şartın tacirler arasında indirilip indirilemeyeceği tartışılıyorsa), Türk Borçlar Kanunu (TBK) ve Türk Ticaret Kanunu (TTK) genel prensipleri dikkate alınmalıdır.
