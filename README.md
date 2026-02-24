# Aequo

**Aequo** es una app híbrida desarrollada en Flutter que permite generar cálculos comparativos inmediatos entre **Renuncia Voluntaria** y **Despido Injustificado**, transformando datos laborales en reportes PDF profesionales, personalizados y listos para utilizarse como evidencia técnica en procesos de conciliación.

---

## Problema que Resuelve

En juntas de conciliación y negociaciones laborales, muchos cálculos se realizan de forma improvisada o con herramientas genéricas.

Aequo:

- Elimina la improvisación
- Proporciona una base matemática sólida
- Presenta comparativas claras entre escenarios legales
- Genera documentos con identidad profesional del abogado o despacho

---

## Propuesta de Valor

Un abogado que presenta un reporte estructurado, visual y fundamentado en ley proyecta mayor autoridad, claridad y preparación frente a la contraparte.

Aequo convierte cálculos en:

- Comparativas visuales
- Reportes PDF personalizados
- Evidencia técnica clara y profesional

---

## Stack Tecnológico

- **Flutter** – Código único para iOS y Android
- **SQLite** – Almacenamiento local de expedientes
- **PDF Library** – Generación de reportes con layouts personalizados
- **Share Plus** – Compartir por WhatsApp y correo electrónico

---

## Arquitectura

### Clean Architecture
Separación clara entre:
- Lógica de negocio (fórmulas legales)
- Capa de presentación
- Infraestructura

### Strategy Pattern
Permite cambiar:
- Algoritmos de cálculo
- Variaciones según tipo de contrato
- Adaptación a cambios legislativos

---

## Funcionalidades Clave

### Doble Escenario en Tiempo Real
Cálculo simultáneo de:
- Finiquito (Renuncia Voluntaria)
- Liquidación (Despido Injustificado)

---

### PDF Branding Engine
- Subida de logo
- Personalización de colores
- Selección de tipografía
- Firma digital

---

### Desglose Aritmético
Explicación paso a paso de:
- Indemnizaciones
- Proporcionales
- ISR
- Prestaciones

---

### Bóveda de Evidencias
- Historial de cálculos
- Búsqueda por empleado o empresa
- Expedientes guardados localmente

---

### Validador de Ley
Notas legales automáticas que respaldan cada concepto calculado.

---

## Pantallas Principales

1. **Onboarding de Identidad**
   - Flujo de configuración inicial de marca y perfil
  
2. **Calculadora Inteligente**
   - Formulario de fechas, salario y prestaciones

3. **Configurador de Estilo**
   - Personalización visual del PDF

4. **Vista Previa de Reporte**
   - Visualización interactiva antes de exportar

5. **Expediente Digital**
   - Listado de cotizaciones generadas

---

## Métrica de Impacto

Objetivo principal:
> Incrementar la percepción de autoridad y preparación profesional mediante reportes estructurados y fundamentados en ley.

---

## 🛠 Instalación (Desarrollo)

```bash
git clone https://github.com/tuusuario/aequo.git
cd aequo
flutter pub get
flutter run
