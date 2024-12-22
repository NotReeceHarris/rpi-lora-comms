<script lang="ts">
	import '../app.css';
	let { children, data } = $props();
	console.log(data);
</script>

{#if data.apiOnline.status === 'online'}
	<main class="bg-black text-white">
		{@render children()}
	</main>
{:else}
	<main>
		
	</main>
{/if}
