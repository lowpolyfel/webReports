import { useEffect, useState } from 'react';
import { getReports, createReport } from './api';
// ⬇️ NUEVO
import { getAvailableDates } from './api';

export default function App() {
  const [items, setItems] = useState([]);
  const [title, setTitle] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState('');

  // ⬇️ NUEVO estado para fechas
  const [dates, setDates] = useState([]);

  async function refresh() {
    setError('');
    try {
      const data = await getReports();
      setItems(data);
    } catch (e) {
      setError(e.message || 'Error loading');
    }
  }

  useEffect(() => { refresh(); }, []);

  // ⬇️ NUEVO: cargar fechas al montar
  useEffect(() => {
    (async () => {
      try {
        const d = await getAvailableDates();
        setDates(d);
      } catch (e) {
        console.error('Error fechas:', e);
      }
    })();
  }, []);

  async function onSubmit(e) {
    e.preventDefault();
    if (!title.trim()) return;
    setBusy(true);
    setError('');
    try {
      await createReport(title.trim());
      setTitle('');
      await refresh();
    } catch (e) {
      setError(e.message || 'Error creating');
    } finally {
      setBusy(false);
    }
  }

  return (
    <div style={{ maxWidth: 720, margin: '40px auto', fontFamily: 'system-ui, sans-serif' }}>
            {/* ⬇️ NUEVO: Botones por fecha */}
      <h2>Fechas disponibles</h2>
      <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8, marginBottom: 16 }}>
        {dates.map(d => (
          <button
            key={d}
            onClick={() => console.log('Seleccionada', d)}
            style={{
              padding: '6px 10px',
              borderRadius: 6,
              background: '#0f172a',
              color: '#e2e8f0',
              border: '1px solid #334155',
              cursor: 'pointer'
            }}
            title={`Ver reportes del ${d}`}
          >
            {new Date(d + 'T00:00:00').toLocaleDateString('es-MX', {
              weekday: 'short', day: '2-digit', month: 'short'
            })}
          </button>
        ))}
        {!dates.length && <span style={{ color: '#888' }}>Sin fechas</span>}
      </div>
      {/* ⬆️ FIN NUEVO */}


      {error && <p style={{ color: 'crimson' }}>{error}</p>}

         </div>
  );
}

