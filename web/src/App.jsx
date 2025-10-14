// web/src/App.jsx
import { Suspense, lazy, useMemo } from "react";
import { HashRouter, Routes, Route, NavLink } from "react-router-dom";

const Dashboard = lazy(() => import("./pages/Dashboard.jsx"));
const Reports   = lazy(() => import("./pages/Reports.jsx"));
const Settings  = lazy(() => import("./pages/Settings.jsx"));

export default function App() {
  // Tema mínimo (sin animaciones, sin sombras pesadas)
  const theme = useMemo(() => ({
    bg: "#0f1115",
    panel: "#141821",
    text: "#e6eaf3",
    muted: "#9aa3b2",
    line: "#1f2430",
    accent: "#4da3ff",
    ok: "#18c964",
    bad: "#ff4d4f",
    warn: "#ffbf47",
  }), []);

  return (
    <HashRouter>
      <div style={{
        minHeight: "100dvh",
        background: theme.bg,
        color: theme.text,
        fontFamily: "ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Inter, Helvetica, Arial",
        margin: 0
      }}>
        <Header theme={theme} />
        <main style={{maxWidth: 1200, margin: "0 auto", padding: "16px"}}>
          <Suspense fallback={<Skeleton />}>
            <Routes>
              <Route path="/" element={<Dashboard theme={theme} />} />
              <Route path="/reports" element={<Reports theme={theme} />} />
              <Route path="/settings" element={<Settings theme={theme} />} />
            </Routes>
          </Suspense>
        </main>
      </div>
    </HashRouter>
  );
}

function Header({ theme }) {
  const linkBase = {
    padding: "10px 12px",
    borderRadius: 10,
    textDecoration: "none",
    color: theme.text,
  };
  return (
    <div style={{
      borderBottom: `1px solid ${theme.line}`,
      background: theme.panel
    }}>
      <div style={{maxWidth: 1200, margin: "0 auto", padding: "12px 16px",
        display: "flex", alignItems: "center", gap: 12, justifyContent: "space-between"}}>

        {/* Imagen desde /public (ver notas más abajo) */}
        <div style={{display: "flex", alignItems: "center", gap: 10}}>
          <img src="/logo.png" alt="Logo" width="28" height="28" loading="lazy"
               onError={(e)=>{e.currentTarget.style.display='none';}} />
          <strong style={{letterSpacing: 0.2}}>webReports</strong>
        </div>

        <nav style={{display: "flex", gap: 6}}>
          <NavLink to="/"      style={({isActive}) => ({...linkBase, background: isActive ? theme.line : "transparent"})}>Dashboard</NavLink>
          <NavLink to="/reports"  style={({isActive}) => ({...linkBase, background: isActive ? theme.line : "transparent"})}>Reportes</NavLink>
          <NavLink to="/settings" style={({isActive}) => ({...linkBase, background: isActive ? theme.line : "transparent"})}>Ajustes</NavLink>
        </nav>
      </div>
    </div>
  );
}

function Skeleton() {
  return (
    <div style={{display:"grid", gap:12}}>
      <div style={{height: 20, background:"#1b2230", borderRadius:8}} />
      <div style={{height: 20, background:"#1b2230", borderRadius:8}} />
      <div style={{height: 260, background:"#1b2230", borderRadius:12}} />
    </div>
  );
}

