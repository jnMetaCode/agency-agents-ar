<div dir="rtl">

# تتبع إصدار upstream

تسجيل لإصدار [agency-agents](https://github.com/msitarzewski/agency-agents) الذي يبني هذا المشروع عليه، لتسهيل مزامنة التحديثات.

## الإصدار المرجعي الحالي

- **مستودع upstream**: https://github.com/msitarzewski/agency-agents
- **commit المرجعي**: `783f6a7` (2026-04-12)
- **إجمالي وكلاء upstream**: 184 (باستثناء 16 وثيقة تشغيلية في `strategy/`)

## تغطية الترجمة

| الفئة | إجمالي upstream | مترجم | التغطية |
|------|----------------:|------:|--------:|
| academic | 5 | 5 | 100% |
| design | 8 | 8 | 100% |
| engineering | 29 | 29 | 100% |
| finance | 5 | 5 | 100% |
| game-development | 20 | 20 | 100% |
| marketing | 30 | 30 | 100% |
| paid-media | 7 | 7 | 100% |
| product | 5 | 5 | 100% |
| project-management | 6 | 6 | 100% |
| sales | 8 | 8 | 100% |
| spatial-computing | 6 | 6 | 100% |
| specialized | 41 | 41 | 100% |
| support | 6 | 6 | 100% |
| testing | 8 | 8 | 100% |
| **الإجمالي** | **184** | **184** | **100%** |

## منهج الترجمة

الإنجليزية upstream → العربية (ترجمة دفعية عبر Claude Sonnet). تحافظ على نبرة وهيكل الأصل مع تعابير طبيعية للقارئ العربي التقني.

- المصطلحات التقنية الإنجليزية الراسخة (TensorFlow / PyTorch / RAG / MLOps / LLM / API / OAuth / REST إلخ): محتفظ بها بالإنجليزية
- كتل الكود، المسارات، الـ URLs، الأوامر: دون تغيير
- النص / العناوين / الجداول / القوائم: مترجمة للعربية الفصحى الطبيعية
- Frontmatter `name:`, `description:`, `vibe:`: مترجمة؛ `color:`, `emoji:`: محتفظ بها

## وكلاء للسوق العربي

علاوة على الـ 184 ترجمة، **PR لوكلاء خاصين بالسوق العربي مرحب بها**. مناطق مفتوحة:

- منصات الشرق الأوسط (Snapchat MENA, TikTok MENA, X Arabic, Instagram Reels MENA)
- التجارة الإلكترونية (Noon, Amazon.sa/ae, Jumia, Salla, Zid)
- Super Apps (Talabat, Careem, Hungerstation, Mrsool)
- التقنية المالية (Tabby, Tamara, STC Pay, Sarie/SAMA)
- الامتثال (SAMA, NCA, DIFC/ADGM, PDPL)

التفاصيل في [CONTRIBUTING.md](./CONTRIBUTING.md).

## سياسة المزامنة

- متابعة فرع `main` في upstream
- الوكلاء الجدد في upstream سيُترجمون تدريجياً
- التغييرات الهيكلية الكبيرة (إعادة تسمية المجلدات إلخ) تُعكس خلال أسبوع
- إصدار upstream يُحدّث في هذا الملف عند كل مزامنة

</div>
