// ==================== FETCH DE BASE DE DATOS ====================

// Cargar ligas desde la base de datos
async function getLigas() {
  const res = await fetch("./backend/get_ligas.php");
  if (!res.ok) throw new Error("Error al obtener ligas");
  return await res.json();
}

// Cargar clubes por liga
async function getClubes(nombreLiga) {
  try {
    const res = await fetch(`./backend/get_clubes.php?nombre_liga=${encodeURIComponent(nombreLiga)}`);
    if (!res.ok) throw new Error("Error HTTP al obtener clubes");

    const data = await res.json();
    if (data.error) throw new Error(data.error);
    return data;

  } catch (err) {
    console.error("❌ getClubes error:", err);
    return [];
  }
}


// Cargar jugadores por club
async function getJugadores(nombreEquipo) {
  const res = await fetch(`./backend/get_jugadores.php?nombre_equipo=${encodeURIComponent(nombreEquipo)}`);
  if (!res.ok) throw new Error("Error al obtener jugadores");
  return await res.json();
}

// ==================== NAVEGACIÓN PRINCIPAL ====================

const navButtons = document.querySelectorAll('.nav-btn');
const sections = document.querySelectorAll('main > section');

navButtons.forEach(btn => {
  btn.addEventListener('click', () => {
    const target = btn.getAttribute('data-target');

    sections.forEach(s => s.classList.add('hidden'));
    document.getElementById(target).classList.remove('hidden');

    navButtons.forEach(b => b.classList.remove('active'));
    btn.classList.add('active');

    if (target === 'clubes') {
      cargarLigas();
    }
    if (target === 'simulador') {
      cargarSimulador();
    }
  });
});

navButtons[0].classList.add('active');

document.getElementById('site-logo').addEventListener('click', () => {
  sections.forEach(s => s.classList.add('hidden'));
  document.getElementById('noticias').classList.remove('hidden');
  navButtons.forEach(b => b.classList.remove('active'));
  navButtons[0].classList.add('active');
});

// ==================== LIGAS ====================

async function cargarLigas() {
  const leagueBoxes = document.getElementById('league-boxes');
  leagueBoxes.innerHTML = '<p>Cargando ligas...</p>';

  try {
    const ligas = await getLigas();
    leagueBoxes.innerHTML = '';

    ligas.forEach(liga => {
      const div = document.createElement('div');
      div.className = 'league-box';
      div.style.cursor = 'pointer';
      div.innerHTML = `<h3>🏆 ${liga.nombre_liga}</h3><p>${liga.pais} — ${liga.division}</p>`;

      div.addEventListener('click', async () => {
        await mostrarClubesLiga(liga.nombre_liga);
      });

      leagueBoxes.appendChild(div);
    });
  } catch (err) {
    leagueBoxes.innerHTML = `<p style="color:red;">❌ Error: ${err.message}</p>`;
  }
}

async function mostrarClubesLiga(nombreLiga) {
  const leagueBoxes = document.getElementById("league-boxes");
  const playersTable = document.getElementById("players-table");

  leagueBoxes.innerHTML = `
    <button id="btn-volver" class="btn-primary">← Volver</button>
    <h2>🏆 ${nombreLiga}</h2>
    <p>Cargando clubes...</p>
  `;
  playersTable.innerHTML = "";

  document.getElementById("btn-volver").addEventListener("click", cargarLigas);

  try {
    // ⚠️ RUTA CORRECTA PARA TU PROYECTO
    const res = await fetch(`./backend/get_clubes.php?nombre_liga=${encodeURIComponent(nombreLiga)}`);

    if (!res.ok) throw new Error("Error HTTP al obtener clubes");

    const clubes = await res.json();
    console.log("Clubes recibidos:", clubes);

    if (clubes.error) throw new Error(clubes.error);
    if (!Array.isArray(clubes) || clubes.length === 0) {
      leagueBoxes.innerHTML += "<p>No hay clubes registrados.</p>";
      return;
    }

    // Crear la tabla
    const tabla = document.createElement("table");
    tabla.className = "data-table";

    tabla.innerHTML = `
      <thead>
        <tr>
          <th>Club</th>
          <th>Estadio</th>
          <th>Año Fund.</th>
          <th>Ver Jugadores</th>
        </tr>
      </thead>
      <tbody>
        ${clubes
          .map(
            c => `
          <tr>
            <td>${c.nombre_equipo}</td>
            <td>${c.nombre_estadio}</td>
            <td>${new Date(c.anio_fundacion).getFullYear()}</td>
            <td><button class="btn-ver" data-club="${c.nombre_equipo}">👀</button></td>
          </tr>
        `
          )
          .join("")}
      </tbody>
    `;

    playersTable.appendChild(tabla);

    // Click en ver jugadores
    document.querySelectorAll(".btn-ver").forEach((btn) => {
      btn.addEventListener("click", async () => {
        const club = btn.getAttribute("data-club");
        await mostrarJugadores(club);
      });
    });
  } catch (err) {
    console.error("❌ Error al cargar clubes:", err);
    playersTable.innerHTML = `<p style='color:red;'>❌ Error al cargar clubes: ${err.message}</p>`;
  }
}


async function mostrarJugadores(nombreEquipo) {
  const playersTable = document.getElementById('players-table');
  playersTable.innerHTML = `<p>Cargando jugadores de ${nombreEquipo}...</p>`;

  try {
    const jugadores = await getJugadores(nombreEquipo);
    if (!jugadores.length) {
      playersTable.innerHTML = `<p>No hay jugadores en ${nombreEquipo}</p>`;
      return;
    }

    const tabla = document.createElement('table');
    tabla.className = 'data-table';
    tabla.innerHTML = `
      <thead>
        <tr>
          <th>Jugador</th>
          <th>Posición</th>
          <th>Valor (€)</th>
          <th>Nacionalidad</th>
        </tr>
      </thead>
      <tbody>
        ${jugadores.map(j => `
          <tr>
            <td>${j.nombre_jugador} ${j.apellido_jugador}</td>
            <td>${j.posicion_jugador}</td>
            <td>€${j.valor_jugador.toLocaleString()}</td>
            <td>${j.nacionalidad}</td>
          </tr>
        `).join('')}
      </tbody>
    `;
    playersTable.innerHTML = '';
    playersTable.appendChild(tabla);
  } catch (err) {
    playersTable.innerHTML = `<p style="color:red;">❌ Error al cargar jugadores: ${err.message}</p>`;
  }
}

// ==================== SIMULADOR DE FICHAJES ====================

async function cargarSimulador() {
  const clubVendedor = document.getElementById('clubVendedor');
  const clubComprador = document.getElementById('clubComprador');
  const jugadorSelect = document.getElementById('jugador');

  clubVendedor.innerHTML = '<option value="">-- Seleccione Club Vendedor --</option>';
  clubComprador.innerHTML = '<option value="">-- Seleccione Club Comprador --</option>';
  jugadorSelect.innerHTML = '<option value="">-- Seleccione Jugador --</option>';

  try {
    const ligas = await getLigas();
    const clubes = [];

    // Cargar todos los clubes de todas las ligas
    for (const liga of ligas) {
      const clubs = await getClubes(liga.nombre_liga);
      clubs.forEach(c => clubes.push(c));
    }

    clubes.forEach(c => {
      const option1 = document.createElement('option');
      option1.value = c.nombre_equipo;
      option1.textContent = c.nombre_equipo;
      clubVendedor.appendChild(option1);

      const option2 = document.createElement('option');
      option2.value = c.nombre_equipo;
      option2.textContent = c.nombre_equipo;
      clubComprador.appendChild(option2);
    });

    clubVendedor.addEventListener('change', async () => {
      jugadorSelect.innerHTML = '<option value="">-- Seleccione Jugador --</option>';
      const jugadores = await getJugadores(clubVendedor.value);
      jugadores.forEach(j => {
        const option = document.createElement('option');
        option.value = JSON.stringify(j);
        option.textContent = `${j.nombre_jugador} ${j.apellido_jugador} (€${j.valor_jugador.toLocaleString()})`;
        jugadorSelect.appendChild(option);
      });
    });

    document.getElementById('btnSimular').addEventListener('click', () => {
      const vendedor = clubVendedor.value;
      const comprador = clubComprador.value;
      const jugadorData = jugadorSelect.value;
      const oferta = parseInt(document.getElementById('oferta').value);
      const resultado = document.getElementById('resultado');

      if (!vendedor || !comprador || !jugadorData || !oferta) {
        resultado.textContent = '❌ Complete todos los campos.';
        resultado.style.color = '#ff4444';
        return;
      }

      if (vendedor === comprador) {
        resultado.textContent = '❌ El club vendedor y comprador no pueden ser el mismo.';
        resultado.style.color = '#ff4444';
        return;
      }

      const jugador = JSON.parse(jugadorData);
      const valor = jugador.valor_jugador;

      if (oferta >= valor * 0.9) {
        resultado.textContent = `✅ Transferencia exitosa: ${jugador.nombre_jugador} se une a ${comprador} por €${oferta.toLocaleString()}`;
        resultado.style.color = '#4CAF50';
      } else if (oferta >= valor * 0.7) {
        resultado.textContent = `⚠️ Oferta rechazada. El club pide al menos €${(valor * 0.9).toLocaleString()}`;
        resultado.style.color = '#ffaa00';
      } else {
        resultado.textContent = `❌ Oferta insuficiente. El valor de mercado es €${valor.toLocaleString()}`;
        resultado.style.color = '#ff4444';
      }
    });

  } catch (err) {
    console.error("Error cargando simulador:", err);
  }
}

// ==================== INICIALIZACIÓN ====================
document.addEventListener('DOMContentLoaded', () => {
  cargarLigas();
});
