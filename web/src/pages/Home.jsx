// web/src/pages/Home.jsx
import { useEffect, useState } from 'react';

const API_BASE = import.meta.env.VITE_API_BASE || 'http://localhost:4000';

export default function Home() {
  const [dates, setDates] = useState([]);
  const [loading, setLoading] = useState(true);
  const [err, setErr] = useState('');

  useEffect(() => {
    const load = async () => {
      try {
        const r = await fetch(`${API_BASE}/api/available-dates`);
        if (!r.ok) throw new Error(`HTTP ${r.status}`);
        const data = await r.json();
        setDates(data.dates || []);
      } catch (e) {
        setErr('No se pudieron cargar las fechas disponibles.');
        console.error(e);
      } finally {
        setLoading(false);
      }
    };
    load();
  }, []);

  if (loading) return <div style={{padding:16}}>Cargando fechas…</div>;
  if (err) return <div style={{padding:16, color:'tomato'}}>{err}</div>;

  if (!dates.length) {
    return <div style={{padding:16}}>No hay fechas registradas todavía.</div>;
  }

  // Render: botones por fecha. Más adelante, al dar click navegaremos a /report/:date
  return (
    <div style={{padding:16}}>
      <h1 style={{marginBottom:12}}>Fechas disponibles</h1>
      <div style={{display:'flex', flexWrap:'wrap', gap:12}}>
        {dates.map(d => (
          <button
            key={d}
            onClick={() => {
              // TODO: en el siguiente paso dirigiremos a una ruta con los reportes del día
              // Por ahora, solo mostramos en consola:
              console.log('Fecha seleccionada:', d);
              // Ejemplo futuro: navigate(`/report/${d}`);
            }}
            style={{
              padding:'10px 14px',
              borderRadius:10,
              border:'1px solid #334155',
              background:'#0f172a',
              color:'#e2e8f0',
              cursor:'pointer'
            }}
            title={`Ver reportes del ${d}`}
          >
            {new Date(d + 'T00:00:00').toLocaleDateString('es-MX', {
              weekday:'short', year:'numeric', month:'short', day:'2-digit'
            })}
          </button>
        ))}
      </div>
    </div>
  );
}

