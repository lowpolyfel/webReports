
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
  const res = await fetch(`${API_BASE}/reports`);
  if (!res.ok) {
    const t = await res.text().catch(()=>'');
    throw new Error(`GET /reports fallo (${res.status}): ${t.slice(0,200)}`);
  }
  return parseJSON(res);
}

export async function createReport(title) {
  const res = await fetch(`${API_BASE}/reports`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ title })
  });
  if (!res.ok) {
    const t = await res.text().catch(()=>'');
    throw new Error(`POST /reports fallo (${res.status}): ${t.slice(0,200)}`);
  }
  return parseJSON(res);
}
