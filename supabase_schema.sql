-- ─────────────────────────────────────────────
-- SLATTR — Supabase Schema
-- Cole isso no SQL Editor do Supabase e execute
-- ─────────────────────────────────────────────

-- Tabela de projetos
CREATE TABLE IF NOT EXISTS projects (
  id          TEXT PRIMARY KEY,
  name        TEXT NOT NULL,
  status      TEXT NOT NULL DEFAULT 'recording',
  color       TEXT NOT NULL DEFAULT '#A35DD7',
  description TEXT DEFAULT '',
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Tabela de aulas
CREATE TABLE IF NOT EXISTS lessons (
  id           TEXT PRIMARY KEY,
  name         TEXT NOT NULL,
  project_id   TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  status       TEXT NOT NULL DEFAULT 'recording',
  date_start   TEXT DEFAULT '',
  date_end     TEXT DEFAULT '',
  priority     TEXT NOT NULL DEFAULT 'alta',
  progress     INTEGER DEFAULT 20,
  checked      BOOLEAN DEFAULT FALSE,
  notes        TEXT DEFAULT '',
  created_at   TIMESTAMPTZ DEFAULT NOW()
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS lessons_project_id_idx ON lessons(project_id);
CREATE INDEX IF NOT EXISTS lessons_status_idx ON lessons(status);

-- Permitir leitura e escrita pública (sem autenticação por enquanto)
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE lessons  ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read projects"   ON projects FOR SELECT USING (true);
CREATE POLICY "Public insert projects" ON projects FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update projects" ON projects FOR UPDATE USING (true);
CREATE POLICY "Public delete projects" ON projects FOR DELETE USING (true);

CREATE POLICY "Public read lessons"    ON lessons FOR SELECT USING (true);
CREATE POLICY "Public insert lessons"  ON lessons FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update lessons"  ON lessons FOR UPDATE USING (true);
CREATE POLICY "Public delete lessons"  ON lessons FOR DELETE USING (true);
