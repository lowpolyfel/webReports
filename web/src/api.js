const API_BASE = import.meta.env.VITE_API_BASE || 'http://localhost:4000/api';

export async function getReports() {
  const res = await fetch(`${API_BASE}/reports`);
  if (!res.ok) throw new Error('Failed to load reports');
  return res.json();
}

export async function createReport(title) {
  const res = await fetch(`${API_BASE}/reports`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ title })
  });
  if (!res.ok) throw new Error('Failed to create report');
  return res.json();
}

