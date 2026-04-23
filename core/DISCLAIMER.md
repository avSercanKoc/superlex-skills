# Standart Feragatname (Disclaimer)

## Amaç

Bu dosya, Lex-Skill ile üretilen her hukuki çıktının sonuna otomatik olarak eklenmesi ZORUNLU olan standart feragatname şablonunu tanımlar.

## Kullanım Kuralı

Her skill, çıktısının en sonuna bu feragatname metnini ekler. Agent bu adımı atlayamaz.

## Feragatname Metni

```
⚖️ YASAL UYARI: Bu belge yapay zeka destekli olarak üretilmiştir.
Hukuki bağlayıcılığı bulunmamaktadır. Kullanılmadan önce mutlaka
yetkili bir avukat tarafından gözden geçirilmelidir. [Tarih] itibarıyla
yürürlükteki mevzuata göre hazırlanmış olup, mevzuat değişiklikleri
takip edilmelidir.
```

## Placeholder Kuralları

| Placeholder | Açıklama | Nasıl Doldurulur |
|-------------|----------|------------------|
| `[Tarih]` | Belgenin üretim tarihi | Agent, belge üretim tarihini otomatik ekler (GG.AA.YYYY formatında) |

## Agent Talimatı

1. Belge üretimini tamamla
2. Agentic Verification Gate'i geç
3. Kullanıcı onayını al
4. Bu feragatmeyi belgenin EN SONUNA ekle
5. `[Tarih]` placeholder'ını üretim tarihiyle değiştir
