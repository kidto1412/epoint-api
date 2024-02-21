<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Foul') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="mb-10">

            </div>
            <div class="bg-white">
                <table class="table-auto w-full">
                    <thead>
                    <tr>
                        <th class="border px-6 py-4">NIS Student</th>
                        <th class="border px-6 py-4">NIP Teacher</th>
                        <th class="border px-6 py-4">Student Name</th>
                        <th class="border px-6 py-4">Teacher name</th>
                        <th class="border px-6 py-4">Foul</th>
                        <th class="border px-6 py-4">Status</th>
                        <th>Foto</th>
                        <th class="border px-6 py-4">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($fouls as $item)
                        <tr>


                            <td class="border px-6 py-4">{{ $item->student_nis }}</td>
                            <td class="border px-6 py-4">{{ $item->student->name }}</td>
                            <td class="border px-6 py-4 ">{{ $item->teacher_nip }}</td>
                            <td class="border px-6 py-4">{{ $item->teacher->name }}</td>
                            <td class="border px-6 py-4">{{ $item->form->name }}</td>
                            <td class="border px-6 py-4">{{ $item->status }}</td>
                            <td class="border px-6 py-4">

                                <img src="{{ asset('storage/'.$item->photo) }}" class="img-fluid img-thumbnail" width="150">
                            </td>
                            <td class="border px-6 py- text-center">
                                <form action="{{url('dashboard/approve/foul', $item->id)}}" method="POST" class="inline-block">
                                    {!! method_field('PUT') . csrf_field() !!}
                                    <button type="submit" class="bg-indigo-500 hover:bg-indigo-700 text-white font-bold py-2 px-4 mx-2  rounded inline-block">
                                        Approve
                                    </button>
                                </form>
                                <div style="margin: 5%;"></div>

                                <form action="{{url('dashboard/reject/foul', $item->id)}}" method="POST" class="inline-block">
                                    {!! method_field('PUT') . csrf_field() !!}
                                    <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 mx-2 rounded inline-block">
                                        Reject
                                    </button>
                                </form>
                                <div style="margin: 5%;"></div>
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
            <div class="text-center mt-5">
                {{ $fouls->links() }}
            </div>
        </div>
    </div>
</x-app-layout>
