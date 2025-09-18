import { useEffect, useState } from 'react';
import { getReports, createReport } from './api';

export default function App() {
  const [items, setItems] = useState([]);
  const [title, setTitle] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState('');

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
      <h1>WebReports</h1>
      <p style={{ color: '#666' }}>React + Node.js + MariaDB (Raspberry Pi)</p>

      <form onSubmit={onSubmit} style={{ display: 'flex', gap: 8 }}>
        <input
          value={title}
          onChange={e => setTitle(e.target.value)}
          placeholder="Nuevo reporte…"
          disabled={busy}
          style={{ flex: 1, padding: 8 }}
        />
        <button disabled={busy || !title.trim()}>{busy ? 'Guardando…' : 'Agregar'}</button>
      </form>

      {error && <p style={{ color: 'crimson' }}>{error}</p>}

      <h2 style={{ marginTop: 24 }}>Reportes</h2>
      <ul>
        {items.map(r => (
          <li key={r.id}>{r.title} <small style={{ color: '#888' }}>({new Date(r.created_at).toLocaleString()})</small></li>
        ))}
      </ul>
    </div>
  );
}

