# Plano de Implementação — Landing Page Redesign

## Ordem de execução

### Fase 1 — Fixes rápidos (css/style.css)
1. Logo: `.nav__logo-img { height: 44px }`
2. Footer opacity: `.footer__copy` → 0.75, `.footer__crm` → 0.80
3. Hero mesh gradient: adicionar radial-gradients duplos
4. Serviços glassmorphism: backdrop-filter nos cards

### Fase 2 — Seção DS Power (index.html + style.css)
5. HTML da seção DS Power (layout C: timeline + contador)
6. CSS da seção DS Power
7. JS do contador ao vivo (fetch + animação + fallback)

### Fase 3 — Seção Depoimentos (index.html + style.css)
8. HTML da seção Depoimentos (layout A: card principal + 2 mini)
9. CSS da seção Depoimentos

### Fase 4 — Seção Números (index.html + style.css)
10. HTML da seção Números (grid 4 contadores)
11. CSS + JS dos contadores animados (IntersectionObserver)

### Fase 5 — Animações globais e polish
12. IntersectionObserver para fade-up em todas as seções
13. CTA Final mesh gradient reforçado
14. prefers-reduced-motion
15. Commit e push
