// web/src/pages/Reports.jsx
import { useMemo, useState } from "react";

export default function Reports({ theme }) {
  // Simulación: evita render masivo en Raspberry. Muestra 50 filas max.
  const [limit] = useState(50);
  const rows = useMemo(() => {
    return Array.from({ length: limit }, (_, i) => ({
      id: i + 1,
      maquina: `WB_${String(i + 1).padStart(3, "0")}`,
      estado: i % 3 === 0 ? "OK" : i % 3 === 1 ? "WARN" : "BAD",
      ciclo: 1000 + i
    }));
  }, [limit]);

  return (
    <section style={{display:"grid", gap: 12}}>
      <h2 style={{margin:"4px 0 0"}}>Reportes (solo vista rápida)</h2>
      <div style={{
        border: `1px solid ${theme.line}`,
        borderRadius: 12,
        overflow: "hidden"
      }}>
        <table style={{width:"100%", borderCollapse:"collapse", fontSize:14}}>
          <thead style={{background:"#101520"}}>
            <tr>
              {["ID","Máquina","Estado","Ciclos"].map(h => (
                <th key={h} style={{textAlign:"left", padding:"10px 12px", borderBottom:`1px solid ${theme.line}`}}>{h}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {rows.map(r => (
              <tr key={r.id} style={{borderBottom:`1px solid ${theme.line}`}}>
                <td style={{padding:"8px 12px"}}>{r.id}</td>
                <td style={{padding:"8px 12px"}}>{r.maquina}</td>
                <td style={{padding:"8px 12px"}}>
                  <StatePill value={r.estado} />
                </td>
                <td style={{padding:"8px 12px"}}>{r.ciclo}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <p style={{color: theme.muted, margin:0}}>Para tablas grandes, pagina o “windowing” más adelante.</p>
    </section>
  );
}

function StatePill({ value }) {
  const color = value === "OK" ? "#18c964" : value === "WARN" ? "#ffbf47" : "#ff4d4f";
  return (
    <span style={{
      display:"inline-block", padding:"2px 8px", borderRadius:999, background: "#0f131c",
      border: `1px solid ${color}`, color
    }}>
      {value}
    </span>
  );
}

