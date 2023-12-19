/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./templates/**/*.html", "./theme/**/*.html"],
  theme: {
    extend: {
      animation: {
        skill: 'skill 0.5s ease-in-out',
      },
      keyframes: {
        skill: {
          '0%': { transform: 'translateX(-100%)' },
          '100%': { transform: 'translateX(0)' },
        },
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
