
import flatpickr from "flatpickr";


const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    allowInput: true,
    mode: "range",
    defaultHour: "8",
    inline: false
  });
}


export { initFlatpickr };
