
import flatpickr from "flatpickr";


const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    allowInput: true,
    mode: "range",
    defaultHour: "7",
    inline: false
  });
}

export { initFlatpickr };
