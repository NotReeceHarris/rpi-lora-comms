<script lang="ts">
	import '../app.css';
	let { children, data } = $props();
	console.log(data);
</script>

{#if data.apiOnline.status === 'success'}
	{@render children()}
{:else}
	<main>
		offline
	</main>
{/if}
