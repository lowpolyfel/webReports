const base = ''; // Vite proxy resuelve /api → backend

export async function getOverview() {
  const r = await fetch(`${base}/api/overview`);
  if (!r.ok) throw new Error('No se pudo cargar overview');
  return r.json();
}

export async function getAvailableDates(scope) {
  const q = scope ? `?scope=${encodeURIComponent(scope)}` : '';
  const r = await fetch(`${base}/api/available-dates${q}`);
  if (!r.ok) throw new Error('No se pudo cargar fechas');
  return r.json();
}

