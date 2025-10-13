import { useEffect, useMemo, useState } from 'react';
import { getOverview } from './api';

// ====== Tema (light/dark) con CSS variables ======
function useTheme() {
  const [theme, setTheme] = useState(() => localStorage.getItem('theme') || 'dark');
  useEffect(() => {
    localStorage.setItem('theme', theme);
    const root = document.documentElement;
    const isLight = theme === 'light';

    // Fondo suave tipo “iOS”
    root.style.setProperty('--bg', isLight ? '#f4f7fb' : '#0a0f1a');
    root.style.setProperty('--panel', isLight ? 'rgba(255,255,255,0.85)' : 'rgba(255,255,255,0.06)');
    root.style.setProperty('--border', isLight ? 'rgba(0,0,0,0.06)' : 'rgba(255,255,255,0.12)');
    root.style.setProperty('--fg', isLight ? '#0b1220' : '#e8ecf5');
    root.style.setProperty('--muted', isLight ? '#5a6785' : '#a3adc0');
    root.style.setProperty('--chip', isLight ? 'rgba(0,0,0,0.06)' : 'rgba(255,255,255,0.10)');
    root.style.setProperty('--accent', isLight ? '#2563eb' : '#60a5fa');
  }, [theme]);
  return { theme, setTheme };
}

// ====== Íconos (inline, sin librerías) ======
const I = {
  machine: (s=22)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="none">
      <path d="M4 7h16v8H4z" stroke="currentColor" strokeWidth="1.6" />
      <path d="M7.5 10h3.5M7.5 12h6" stroke="currentColor" strokeWidth="1.6" />
      <circle cx="18" cy="17" r="1.6" fill="currentColor"/>
      <circle cx="6" cy="17" r="1.6" fill="currentColor"/>
    </svg>
  ),
  operator: (s=22)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="none">
      <circle cx="12" cy="8.2" r="3.4" stroke="currentColor" strokeWidth="1.6"/>
      <path d="M5 19c0-3.3 3.2-6 7-6s7 2.7 7 6" stroke="currentColor" strokeWidth="1.6"/>
    </svg>
  ),
  tech: (s=22)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="none">
      <path d="M8 4h8v4H8zM6 10h12v8H6z" stroke="currentColor" strokeWidth="1.6"/>
      <path d="M10 14h4" stroke="currentColor" strokeWidth="1.6"/>
    </svg>
  ),
  reel: (s=22)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="none">
      <circle cx="12" cy="12" r="7" stroke="currentColor" strokeWidth="1.6"/>
      <circle cx="12" cy="12" r="2.2" fill="currentColor"/>
      <path d="M5 12h2.2M16.8 12H19" stroke="currentColor" strokeWidth="1.6"/>
    </svg>
  ),
  hr: (s=22)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="none">
      <rect x="5" y="4" width="14" height="16" rx="2" stroke="currentColor" strokeWidth="1.6"/>
      <path d="M8 8h8M8 12h8M8 16h6" stroke="currentColor" strokeWidth="1.6"/>
    </svg>
  ),
  users: (s=22)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="none">
      <circle cx="9" cy="8" r="3.1" stroke="currentColor" strokeWidth="1.6"/>
      <path d="M4 19c0-3 2.9-5.1 6-5.1" stroke="currentColor" strokeWidth="1.6"/>
      <circle cx="17" cy="9.2" r="2.6" stroke="currentColor" strokeWidth="1.6"/>
      <path d="M14.5 19c.4-2.3 2.3-3.8 4.3-3.8" stroke="currentColor" strokeWidth="1.6"/>
    </svg>
  ),
  dotmenu: (s=18)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="currentColor">
      <circle cx="5" cy="12" r="1.6"/><circle cx="12" cy="12" r="1.6"/><circle cx="19" cy="12" r="1.6"/>
    </svg>
  ),
  clip: (s=16)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="none"><path d="M7 12l6-6a4 4 0 115.7 5.7L10.8 19a5 5 0 11-7.1-7.1l7.8-7.8" stroke="currentColor" strokeWidth="1.6"/></svg>
  ),
  chat: (s=16)=>(
    <svg width={s} height={s} viewBox="0 0 24 24" fill="none"><path d="M20 12a7.5 7.5 0 01-7.5 7.5H6l-2.5 2.5V12A7.5 7.5 0 0111 4.5h1.5A7.5 7.5 0 0120 12z" stroke="currentColor" strokeWidth="1.6"/></svg>
  ),
};

// ====== Estilos base (tarjetas grandes, look “cristal líquido”) ======
const page = {
  minHeight: '100dvh',
  background: 'var(--bg)',
  color: 'var(--fg)',
  fontFamily: 'system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif',
  padding: 28,
};

const header = {
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'space-between',
  marginBottom: 22,
};

const glass = {
  background: 'var(--panel)',
  border: '1px solid var(--border)',
  borderRadius: 18,
  backdropFilter: 'blur(16px)',
  WebkitBackdropFilter: 'blur(16px)',
  boxShadow: '0 14px 50px rgba(0,0,0,0.18)',
};

const grid = {
  display: 'grid',
  gridTemplateColumns: 'repeat(auto-fit, minmax(340px, 1fr))', // TARJETAS GRANDES
  gap: 22,
};

const muted = { color: 'var(--muted)', fontSize: 12 };

// Banner abstracto (SVG background tipo “líquido”)
function Banner({ image }) {
  return (
    <div style={{
      position: 'relative',
      height: 140,
      borderRadius: 16,
      overflow: 'hidden',
      border: '1px solid var(--border)',
      backgroundColor: 'rgba(0,0,0,0.1)',
    }}>
      <img
        src={`/banners/${image}`}
        alt=""
        style={{
          width: '100%',
          height: '100%',
          objectFit: 'cover',
          filter: 'brightness(0.8) saturate(1.1)',
        }}
      />
      <div style={{
        position: 'absolute',
        inset: 0,
        background: 'linear-gradient(to bottom, rgba(0,0,0,0.3), rgba(0,0,0,0.45))',
        mixBlendMode: 'multiply',
      }} />
    </div>
  );
}

// Tarjeta tipo “kanban” pero horizontalmente limpia
function Card({ icon, title, subtitle, total, last, hue, badgeLabel, onClick }) {
  return (
    <div
      onClick={onClick}
      style={{
        ...glass,
        borderRadius: 22,
        overflow: 'hidden',
        cursor: 'pointer',
        transition: 'transform .2s ease, box-shadow .2s ease',
      }}
      onMouseEnter={e => e.currentTarget.style.transform = 'translateY(-2px)'}
      onMouseLeave={e => e.currentTarget.style.transform = 'translateY(0)'}
    >
      {/* header */}
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: 14 }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
          <div style={{ color: 'var(--fg)' }}>{icon}</div>
          <div style={{ fontSize: 16, fontWeight: 800 }}>{title}</div>
          <span style={{
            marginLeft: 8,
            padding: '2px 10px',
            borderRadius: 999,
            fontSize: 12,
            color: 'var(--fg)',
            background: `hsla(${hue}, 80%, 55%, .18)`,
            border: '1px solid var(--border)'
          }}>{badgeLabel}</span>
        </div>
        <div style={{ color: 'var(--muted)' }}>{I.dotmenu(18)}</div>
      </div>

      {/* banner */}
      <div style={{ padding: '0 14px' }}>
        <Banner hue={hue}/>
      </div>

      {/* body */}
      <div style={{ padding: 16, paddingTop: 12 }}>
        <div style={{ color: 'var(--muted)', marginBottom: 8 }}>{subtitle}</div>

        <div style={{ display: 'flex', alignItems: 'center', gap: 14, marginBottom: 8 }}>
          <div style={{
            padding: '6px 10px',
            background: `hsla(${hue},80%,55%,.16)`,
            border: '1px solid var(--border)',
            borderRadius: 10,
            fontWeight: 800,
            fontSize: 22,
            letterSpacing: .3,
            color: 'var(--fg)',
            minWidth: 88,
            textAlign: 'center'
          }}>
            {total ?? '—'}
          </div>
          <div style={{ ...muted }}>
            Última actividad:{' '}
            <span style={{ color: 'var(--fg)' }}>{last ? new Date(last).toLocaleString() : '—'}</span>
          </div>
        </div>

        {/* footer metadatos (look tipo adjuntos/comentarios) */}
        <div style={{ display: 'flex', alignItems: 'center', gap: 16, color: 'var(--muted)' }}>
          <span style={{ display: 'inline-flex', alignItems: 'center', gap: 6 }}>{I.clip()} Info</span>
          <span style={{ display: 'inline-flex', alignItems: 'center', gap: 6 }}>{I.chat()} Detalles</span>
        </div>
      </div>
    </div>
  );
}

// ====== App ======
export default function App() {
  const { theme, setTheme } = useTheme();
  const [overview, setOverview] = useState(null);
  const [err, setErr] = useState('');
  const [selected, setSelected] = useState(null); // tarjeta activa (para el próximo paso: fechas)

  // Cargar overview
  useEffect(() => {
    (async () => {
      try {
        setErr('');
        const ov = await getOverview();
        setOverview(ov);
      } catch (e) {
        setErr(e.message || 'Error cargando datos');
      }
    })();
  }, []);

  // Definición “manager-friendly” (sin jerga)
  const cards = useMemo(() => {
    const ov = overview;
  return [
    {
      key: 'operacion',
      title: 'Producción por máquina',
      subtitle: 'Resumen de turnos: eficiencia, volumen y tiempos de operación por equipo.',
      icon: I.machine(),
      image: 'machine.jpg',
      total: ov?.totals?.operaciones,
      last: ov?.lastActivity?.operacion_maquina,
      badge: 'Producción'
    },
    {
      key: 'operador',
      title: 'Actividad de operadores',
      subtitle: 'Tiempos activos por persona y puesto; trazabilidad por máquina.',
      icon: I.operator(),
      image: 'operators.jpg',
      total: ov?.totals?.reg_operador,
      last: ov?.lastActivity?.registro_operador,
      badge: 'Personal'
    },
    {
      key: 'tecnico',
      title: 'Soporte técnico en piso',
      subtitle: 'Atenciones y asistencias por equipo, para medir respuesta y cobertura.',
      icon: I.tech(),
      image: 'technicians.jpg',
      total: ov?.totals?.reg_tecnico,
      last: ov?.lastActivity?.registro_tecnico,
      badge: 'Soporte'
    },
    {
      key: 'carrete',
      title: 'Uso de insumos (carrete)',
      subtitle: 'Seguimiento de carretes: utilización y trazabilidad por máquina y operador.',
      icon: I.reel(),
      image: 'reel.jpg',
      total: ov?.totals?.reg_carrete,
      last: ov?.lastActivity?.registro_carrete,
      badge: 'Material'
    },
    {
      key: 'maquinas',
      title: 'Catálogo de equipos',
      subtitle: 'Inventario de máquinas con su tipo, ubicación y flujo asignado.',
      icon: I.machine(),
      image: 'machines_catalog.jpg',
      total: ov?.totals?.maquinas,
      last: ov?.lastActivity?.operacion_maquina,
      badge: 'Activos'
    },
    {
      key: 'operadores',
      title: 'Personal operativo',
      subtitle: 'Listado de operadores asignados y su productividad por máquina.',
      icon: I.users(),
      image: 'staff.jpg',
      total: ov?.totals?.operadores,
      last: ov?.lastActivity?.registro_operador,
      badge: 'Equipo'
    },
    {
      key: 'tecnicos',
      title: 'Equipo técnico',
      subtitle: 'Técnicos disponibles por turno y línea de producción.',
      icon: I.tech(),
      image: 'team.jpg',
      total: ov?.totals?.tecnicos,
      last: ov?.lastActivity?.registro_tecnico,
      badge: 'Equipo'
    },
    {
      key: 'hr',
      title: 'Órdenes de trabajo (HR)',
      subtitle: 'Work orders activas, producto y metas asociadas al proceso.',
      icon: I.hr(),
      image: 'orders.jpg',
      total: ov?.totals?.hr,
      last: ov?.lastActivity?.operacion_maquina,
      badge: 'Órdenes'
    },
    {
      key: 'reels',
      title: 'Carretes disponibles',
      subtitle: 'Inventario actualizado de carretes y su estado operativo.',
      icon: I.reel(),
      image: 'inventory.jpg',
      total: ov?.totals?.reels,
      last: ov?.lastActivity?.registro_carrete,
      badge: 'Inventario'
    },
  ];
}, [overview]);

  return (
    <div style={page}>
      {/* Header */}
      <header style={header}>
        <div>
          <div style={{ fontSize: 28, fontWeight: 900, letterSpacing: .2 }}>WebReports · Dashboard</div>
          <div style={muted}>Base: <b>wb_db</b></div>
        </div>

        <div style={{ display: 'flex', gap: 10, alignItems: 'center' }}>
          <button
            onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}
            style={{
              ...glass,
              borderRadius: 999,
              padding: '8px 12px',
              fontSize: 13,
              color: 'var(--fg)',
              background: 'var(--panel)',
              border: '1px solid var(--border)',
            }}
            title="Alternar día/noche"
          >
            {theme === 'light' ? '🌙 Noche' : '☀️ Día'}
          </button>
          <div style={{ ...glass, padding: '8px 12px', borderRadius: 12, fontSize: 13 }}>
            {overview ? 'Conectado' : 'Cargando…'}
          </div>
        </div>
      </header>

      {err && (
        <div style={{ ...glass, padding: 12, borderLeft: '4px solid #ef4444', marginBottom: 16, color: 'var(--fg)' }}>
          <b>Error:</b> {err}
        </div>
      )}

      {/* Grid de TARJETAS GRANDES (estilo de tu referencia) */}
      <section style={grid}>
        {cards.map(c => (
          <Card
            key={c.key}
            icon={c.icon}
            title={c.title}
            subtitle={c.subtitle}
            total={c.total}
            last={c.last}
            hue={c.hue}
            badgeLabel={c.badge}
            onClick={() => {
              setSelected(c); // siguiente paso: abrir fechas para esta tarjeta
              // por ahora solo feedback visual
            }}
          />
        ))}
      </section>

      {/* Indicador de selección (opcional) */}
      {selected && (
        <div style={{ marginTop: 16, textAlign: 'center', color: 'var(--muted)' }}>
          Seleccionado: <b style={{ color: 'var(--fg)' }}>{selected.title}</b> — (en el siguiente paso abrimos sus fechas)
        </div>
      )}
    </div>
  );
}

