<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{--            {{ __('Teacher') }}--}}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="mb-10">
                <a href="{{ route('category.create') }}" class="bg-indigo-500 rounded py-2 px-4 mx-2 text-white rounded">
                    + Create Category
                </a>
            </div>
            <div class="bg-white">
                <table class="table-auto w-full">
                    <thead>
                    <tr>
                        <th class="border px-6 py-4">No</th>
                        <th class="border px-6 py-4">Name</th>
                        <th class="border px-6 py-4">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @php $no = 1; @endphp
                    @forelse($category as $item)

                        <tr>
                            <td class="border px-6 py-4">{{ $no++ }}</td>
                            <td class="border px-6 py-4 ">{{ $item->name }}</td>
                            <td class="border px-6 py">
                                <a href="{{ route('category.edit', $item->id) }}" class="inline-block bg-yellow-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mx-2 rounded">
                                    Edit
                                </a>
                                <form action="{{ route('category.destroy', $item->id) }}" method="POST" class="inline-block">
                                    {!! method_field('delete') . csrf_field() !!}
                                    <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 mx-2 rounded inline-block">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="border text-center p-5">
                                Data Tidak Ditemukan
                            </td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
            <div class="text-center mt-5" style="background-color: red">
                {{ $category->links() }}
                {{--                {{$teacher->appends(Request::all())->links()}}--}}
            </div>
        </div>
    </div>
</x-app-layout>
