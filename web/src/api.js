
const API_BASE = (import.meta.env.VITE_API_BASE && import.meta.env.VITE_API_BASE.trim()) || '/api';

if (import.meta.env.DEV) console.log('[API_BASE]', API_BASE);

async function parseJSON(res) {
  const ct = res.headers.get('content-type') || '';
  if (!ct.includes('application/json')) {
    const text = await res.text();
    throw new Error(`Respuesta no-JSON (${res.status}) de ${res.url}: ${text.slice(0,200)}`);
  }
  return res.json();
}

export async function getReports() {
  const r = await fetch('/api/reports');
  if (!r.ok) throw new Error(`HTTP ${r.status}`);
  return r.json();
}

export async function createReport(title) {
  const r = await fetch('/api/reports', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ title })
  });
  if (!r.ok) throw new Error(`HTTP ${r.status}`);
  return r.json();
}

export async function getAvailableDates() {
  const r = await fetch('/api/available-dates');
  if (!r.ok) throw new Error(`HTTP ${r.status}`);
  const data = await r.json();
  return data.dates || [];
}

