// web/src/pages/Settings.jsx
export default function Settings({ theme }) {
  return (
    <section style={{display:"grid", gap: 12}}>
      <h2 style={{margin:"4px 0 0"}}>Ajustes</h2>
      <div style={{
        border: `1px solid ${theme.line}`,
        borderRadius: 12, padding: 12, background: "#0f131c"
      }}>
        <p style={{margin:0, color: theme.muted}}>
          Mantuvimos solo lo esencial para velocidad en Raspberry Pi.
        </p>
        <ul style={{margin:"8px 0 0"}}>
          <li>Sin animaciones, sin librerías de UI pesadas.</li>
          <li>Imágenes desde <code>/public</code> (ver notas).</li>
          <li>Code splitting por ruta.</li>
        </ul>
      </div>
    </section>
  );
}

