# Landing Page Dr. Diego Silva — Redesign Spec

**Data:** 2026-05-16  
**Status:** Aprovado pelo cliente  
**Arquivo alvo:** `index.html` + `css/style.css`

---

## 1. Objetivo

Elevar a landing page de profissional-funcional para alto padrão premium, mantendo identidade visual já estabelecida. Adicionar 3 novas seções, corrigir problemas visuais existentes e integrar contador de resultados ao vivo do ClinicDS Pro.

---

## 2. Direção Visual

**Estilo:** Glass + Mesh Gradient com elementos de Refinamento Premium  
**Referência:** Fintech/healthtech de luxo — dark luxury, contemporâneo  

### Paleta (inalterada)
| Token | Hex | Uso |
|-------|-----|-----|
| `--green-deep` | `#1A4A38` | Superfícies, gradientes |
| `--gold` | `#B89A6A` | Acentos, destaques, ícones |
| `--cream` | `#F4EFE6` | Texto principal, backgrounds claros |
| `--teal` | `#8AADA0` | Texto secundário |
| `--black` | `#090909` | Background base |

### Tipografia (inalterada)
- **Cormorant Garamond** — títulos, quotes, numerais grandes
- **Montserrat** — corpo, labels, botões, UI

### Elementos visuais novos
- **Mesh gradients:** `radial-gradient` duplo (verde + dourado) em hero e CTA
- **Glassmorphism:** `background: rgba(255,255,255,0.04)` + `backdrop-filter: blur(10-20px)` + `border: 1px solid rgba(184,154,106,0.2)`
- **Micro-animações:** fade-up no scroll com `IntersectionObserver`, contadores numéricos animados

---

## 3. Estrutura de Seções

### 3.1 Nav (fix)
- Logo: `height: 44px` (era 30px)
- Botão "Agendar": borda dourada, fundo glassmorphism sutil
- Sem mudanças estruturais

### 3.2 Hero (refinamento)
- Mesh gradient duplo no background: verde esquerda + dourado direita
- Card de depoimento no hero com glassmorphism
- Contadores menores já existentes: manter e refinar estilo

### 3.3 Dores (refinamento mínimo)
- Gradientes de borda dos cards mais ricos (gold → transparente)
- Manter copy atual

### 3.4 Serviços (glassmorphism)
- Cards com `backdrop-filter: blur(10px)` + borda dourada sutil
- Hover state: leve glow dourado + elevação
- Manter copy atual

### 3.5 DS Power (NOVO)
**Layout C:** split horizontal — timeline à esquerda, contador + stats à direita

**Esquerda — timeline 4 passos:**
1. Avaliação Completa — Hormonal, metabólica e nutricional
2. Protocolo Individualizado — Criado para o seu organismo
3. Suporte Contínuo — Acesso direto ao médico
4. Resultado Real — Acompanhamento até sua meta

**Direita — contador ao vivo + stats:**
- Contador de kg: puxa de `https://app.clinicdspro.com.br/api/public/stats`
- Atualiza a cada 5 minutos
- Fallback: último valor conhecido em cache
- Badge "● ao vivo" animado
- Stat: `+1.200 atendimentos`
- Stat: `16k seguidores`

**Copy (CFM-compliant, sem mencionar medicamentos):**
- Badge: `PROGRAMA EXCLUSIVO`
- Título: `DS Power`
- Subtítulo: `Acompanhamento médico de alto padrão`

### 3.6 Depoimentos (NOVO)
**Layout A:** 1 card principal grande + 2 mini cards

- Card principal: glassmorphism completo, quote em destaque, avatar inicial, nome + resultado
- 2 mini cards: borda dourada sutil, quote, nome
- Texto placeholder (substituir por depoimentos reais ao disponibilizar)
- 5 estrelas em dourado

### 3.7 Números / Resultados (NOVO)
Contadores animados em grid 2×2 ou 4 colunas:
- `+1.200` — Atendimentos realizados
- `16k` — Seguidores Instagram
- `5★` — Avaliação média
- `7+` — Anos de experiência

Animação: contagem de 0 até o valor final ao entrar no viewport (IntersectionObserver).

### 3.8 Sobre (manter)
Sem mudanças estruturais. Refinar gradiente do fundo.

### 3.9 Formação (manter)
Sem mudanças.

### 3.10 Família (manter)
Sem mudanças.

### 3.11 CTA Final (refinamento)
- Mesh gradient mais rico (duplo, verde + dourado)
- Botão primário com borda dourada animada

### 3.12 Footer (fix)
- `.footer__copy`: opacidade de `0.22` → `0.75`
- `.footer__crm`: opacidade de `0.45` → `0.80`
- Manter estrutura atual (emblem + logo horizontal)

---

## 4. Integração — Contador ao vivo

**Endpoint:** `GET https://app.clinicdspro.com.br/api/public/stats`  
**Response:** `{ "totalLostKg": 1847.3 }`  
**Cache:** resposta tem `Cache-Control: s-maxage=300`  
**Implementação no frontend:**
```js
async function fetchKgCounter() {
  try {
    const res = await fetch('https://app.clinicdspro.com.br/api/public/stats')
    const { totalLostKg } = await res.json()
    animateCounter(document.getElementById('kg-counter'), totalLostKg)
  } catch {
    // fallback: mantém valor estático
  }
}
```
**Animação:** incremento suave de 0 até valor real em ~1.5s (easeOut)  
**Formato exibido:** `1.847 kg` (milhar separado por ponto)

---

## 5. Animações

| Elemento | Animação | Trigger |
|----------|----------|---------|
| Seções | fade-up (opacity 0→1, translateY 20px→0) | IntersectionObserver |
| Contadores | count up 0→N em 1.5s | IntersectionObserver |
| Cards de serviço | hover: translateY(-4px) + gold glow | :hover |
| Badge "ao vivo" | pulse opacity | CSS keyframes |
| Botões CTA | border-color shimmer | CSS keyframes |

**Respeitar `prefers-reduced-motion`:** todas as animações com `@media (prefers-reduced-motion: reduce)`.

---

## 6. Arquivos alterados

| Arquivo | Tipo de mudança |
|---------|----------------|
| `index.html` | Adicionar 3 seções, corrigir logo, refinar hero/serviços/CTA/footer |
| `css/style.css` | Glassmorphism, mesh gradients, animações, fix footer opacity |

---

## 7. Fora de escopo

- Não criar novo framework ou build tool
- Não alterar imagens existentes
- Não mudar URLs ou estrutura de arquivos
- Não criar backend adicional (API já criada no ClinicDS Pro)
