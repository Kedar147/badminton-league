document.addEventListener("turbo:load", () => {
  const winnerSelect = document.getElementById("winner_select");
  const loserSelect = document.getElementById("loser_select");

  if (!winnerSelect || !loserSelect) return;

  function updateLoserOptions() {
    const winnerValue = winnerSelect.value;
    loserSelect.disabled = false;
    loserSelect.value = "";
    Array.from(loserSelect.options).forEach(option => {
      option.disabled = option.value === winnerValue;
    });
  }
  updateLoserOptions();

  winnerSelect.addEventListener("change", updateLoserOptions);
});