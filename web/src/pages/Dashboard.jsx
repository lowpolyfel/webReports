// web/src/pages/Dashboard.jsx
export default function Dashboard({ theme }) {
  return (
    <section style={{display:"grid", gap: 12}}>
      <Card theme={theme} title="Resumen">
        <p style={{color: theme.muted, margin: 0}}>
          Cargado en modo rápido. Sin animaciones ni librerías pesadas.
        </p>
      </Card>
      <Card theme={theme} title="Estatus">
        <ul style={{margin: 0, paddingLeft: "1rem"}}>
          <li>Rendimiento optimizado</li>
          <li>Imágenes desde <code>/public</code> con <code>loading="lazy"</code></li>
          <li>Rutas con <code>HashRouter</code> (evita 404 en servidores simples)</li>
        </ul>
      </Card>
    </section>
  );
}

function Card({ theme, title, children }) {
  return (
    <div style={{
      border: `1px solid ${theme.line}`,
      borderRadius: 14,
      padding: 12,
      background: "#0f131c"
    }}>
      <div style={{display:"flex", justifyContent:"space-between", marginBottom:8}}>
        <strong>{title}</strong>
      </div>
      {children}
    </div>
  );
}

