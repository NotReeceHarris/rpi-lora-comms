export const ssr = true;

export const load = async ({ fetch }: { fetch: (input: RequestInfo, init?: RequestInit) => Promise<Response> }) => {
    try {
        const response = await fetch('http://localhost:8000/');
        if (!response.ok) {
            throw new Error('API request failed');
        }

        const data = await response.json();
        // If the API request is successful, return the data for the successful case
        return {
            apiOnline: {
                status: 'success',
                data: data
            }
        };
    } catch (error) {
        // If the API request fails, return an error status
        console.log(error)
        return {
            apiOnline: {
                status: 'error',
                error: error instanceof Error ? error.message : 'Unknown error'
            }
        };
    }
};