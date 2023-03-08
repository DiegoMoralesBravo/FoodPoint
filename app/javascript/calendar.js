var picker = new Pikaday(
  {
      field: document.getElementById('datepicker-input'),

      firstDay: 1,
      minDate: new Date('2000-01-01'),
      bound: false,
      container: document.getElementById('container'),
  });