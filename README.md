# Slattr — Deploy Guide

## Stack
- **Frontend**: HTML + CSS + JS puro (single file)
- **Database**: Supabase (PostgreSQL)
- **Hosting**: Vercel via GitHub

---

## Passo 1 — Supabase

1. Acesse [supabase.com](https://supabase.com) e faça login
2. Crie um **New Project** (anote a senha do banco)
3. Vá em **SQL Editor** → clique em **New Query**
4. Cole o conteúdo de `supabase_schema.sql` e clique em **Run**
5. Vá em **Project Settings → API**
6. Copie:
   - **Project URL** → ex: `https://xxxx.supabase.co`
   - **anon public key** → chave longa começando com `eyJ...`

---

## Passo 2 — Configurar o index.html

Abra `index.html` e localize estas duas linhas no início do `<script>`:

```js
const SUPABASE_URL = 'COLE_SUA_URL_AQUI';
const SUPABASE_KEY = 'COLE_SUA_ANON_KEY_AQUI';
```

Substitua pelos valores copiados no Passo 1.

---

## Passo 3 — GitHub

1. Acesse [github.com](https://github.com) e faça login
2. Clique em **New repository**
   - Nome: `slattr`
   - Visibilidade: **Private** (recomendado)
   - Clique em **Create repository**
3. Na pasta `slattr-app`, execute no terminal:

```bash
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/slattr.git
git push -u origin main
```

---

## Passo 4 — Vercel

1. Acesse [vercel.com](https://vercel.com) e faça login com GitHub
2. Clique em **Add New Project**
3. Importe o repositório `slattr`
4. Configurações:
   - **Framework Preset**: Other
   - **Root Directory**: `./`
   - **Build Command**: (deixe vazio)
   - **Output Directory**: `./`
5. Clique em **Deploy**

Pronto! O site estará em `https://slattr.vercel.app` (ou similar).

---

## Atualizações futuras

Para atualizar o site, basta fazer um novo commit:
```bash
git add .
git commit -m "update"
git push
```
O Vercel detecta automaticamente e faz novo deploy.

---

## Compartilhar com a equipe

Envie o link do Vercel para toda a equipe. Como os dados estão no Supabase (público por enquanto), todos veem e editam os mesmos dados em tempo real.
