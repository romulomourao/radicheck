<script>
 import Chart from 'chart.js';
import { onMount } from 'svelte';
export let dataset;
export let labels;

const data = {
  labels,
  datasets: [{
    data: dataset,
    backgroundColor: [
      'rgb(255, 99, 132)',
      'rgb(54, 162, 235)',
      'rgb(255, 205, 86)'
    ],
    hoverOffset: 4
  }]
};

  let container;

  const config = {
    type: 'pie',
    data,
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'top',
        }
      }
    },
  };

  onMount(() => {
    const ctx = container.getContext('2d');
    new Chart(ctx, config)
  })
</script>

<canvas bind:this={container}></canvas>
