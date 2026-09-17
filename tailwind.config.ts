import type { Config } from "tailwindcss";

export default {
  content: ["./src/**/*.{ts,tsx}"],
  theme: {
    extend: {
      colors: {
        ink: {
          DEFAULT: "#16150F",
          soft: "#3B3A34",
          mute: "#8B8A83",
          line: "#E8E6E1",
        },
        canvas: "#EFEDE8",
        paper: "#FFFEF8",
        surface: "#FFFFFF",
        brand: {
          50: "#FFF1EB",
          100: "#FFE0D2",
          200: "#FFC0A6",
          300: "#FF9C74",
          400: "#FF7A47",
          500: "#F4511E",
          600: "#DC3F10",
          700: "#B3320C",
        },
        ok: "#12A150",
        warn: "#E8A317",
        danger: "#E5484D",
        info: "#3B82F6",
      },
      borderRadius: {
        card: "20px",
        pill: "999px",
      },
      boxShadow: {
        card: "0 1px 2px rgba(22,21,15,0.04), 0 8px 24px -12px rgba(22,21,15,0.10)",
        pop: "0 12px 40px -12px rgba(22,21,15,0.24)",
      },
      fontFamily: {
        sans: ["var(--font-sans)", "system-ui", "sans-serif"],
      },
    },
  },
  plugins: [],
} satisfies Config;
